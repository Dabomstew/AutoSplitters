// Deterministic host for the actual ASL action bodies. API signatures follow
// LiveSplit ASLMethod / ComponentUtil; no LiveSplit binary is required.
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.Linq;
using LiveSplit.Model;
using LiveSplit.ComponentUtil;
namespace LiveSplit.Model {
    public enum TimerPhase { NotRunning, Running, Paused, Ended }
    public struct Time { public TimeSpan? RealTime; public TimeSpan? GameTime; }
    public class LiveSplitState {
        public TimerPhase CurrentPhase;
        public Time CurrentTime;
        public bool IsGameTimePaused;
        public event EventHandler OnStart, OnPause, OnResume;
        public void Start() { CurrentPhase = TimerPhase.Running; if (OnStart != null) OnStart(this, EventArgs.Empty); }
        public void Pause() { CurrentPhase = TimerPhase.Paused; if (OnPause != null) OnPause(this, EventArgs.Empty); }
        public void Resume() { CurrentPhase = TimerPhase.Running; if (OnResume != null) OnResume(this, EventArgs.Empty); }
    }
}
namespace LiveSplit.ComponentUtil {
    public class ProcessModuleWow64Safe {
        public IntPtr BaseAddress;
        public int ModuleMemorySize;
        public string ModuleName;
    }
    public enum MemPageState : uint { MEM_COMMIT = 0x1000 }
    public enum MemPageProtect : uint { PAGE_READWRITE = 4 }
    public struct MemoryBasicInformation {
        public IntPtr BaseAddress;
        public UIntPtr RegionSize;
        public MemPageState State;
        public MemPageProtect Protect;
    }
    public static class Memory {
        public static List<ProcessModuleWow64Safe> Modules;
        public static Dictionary<long, byte> Bytes;
        public static Action<IntPtr, int> BeforeRead;
        public static int StateReads, ModuleReads;
        public static long Base = 0x10000000, Root = Base + 0x3000, Marker = Base + 0x1000;
        public static void Reset(bool proxy) {
            Bytes = new Dictionary<long, byte>(); BeforeRead = null; StateReads = ModuleReads = 0;
            Modules = new List<ProcessModuleWow64Safe> {
                new ProcessModuleWow64Safe { BaseAddress = new IntPtr(0x400000), ModuleMemorySize = 76976128, ModuleName = "NeptuniaVII.exe" }
            };
            if (proxy) Modules.Add(new ProcessModuleWow64Safe { BaseAddress = new IntPtr(Base), ModuleMemorySize = 0x4000, ModuleName = "dinput8.dll" });
            for (int i = 0; i < 0x4000; i++) Bytes[Base + i] = 0;
            Put(Marker, System.Text.Encoding.ASCII.GetBytes("VIILT001"));
            U32(Marker + 8, 1); U32(Marker + 12, 24); U32(Marker + 16, (uint)Root); U32(Marker + 20, 112);
            Snapshot(0, 0, 0, 1000);
        }
        public static void Put(long address, byte[] data) { for (int i = 0; i < data.Length; i++) Bytes[address + i] = data[i]; }
        public static void U32(long address, uint value) { Put(address, BitConverter.GetBytes(value)); }
        public static void I64(long address, long value) { Put(address, BitConverter.GetBytes(value)); }
        public static void Snapshot(long completed, uint reason, long opened, long observed) {
            U32(Root, 4); U32(Root + 8, 1); U32(Root + 12, 1); U32(Root + 16, reason);
            U32(Root + 20, reason); U32(Root + 32, 1); U32(Root + 36, 0);
            I64(Root + 56, 1000); I64(Root + 64, completed); I64(Root + 72, opened); I64(Root + 80, observed);
        }
    }
    public static class Extensions {
        public static ProcessModuleWow64Safe[] ModulesWow64Safe(this Process process) { Memory.ModuleReads++; return Memory.Modules.ToArray(); }
        public static byte[] ReadBytes(this Process process, IntPtr address, int size) {
            if (address.ToInt64() == Memory.Root) Memory.StateReads++;
            if (Memory.BeforeRead != null) Memory.BeforeRead(address, size);
            var bytes = new byte[size];
            for (int i = 0; i < size; i++) if (!Memory.Bytes.TryGetValue(address.ToInt64() + i, out bytes[i])) return null;
            return bytes;
        }
    }
    public static class WinAPI {
        public static UIntPtr VirtualQueryEx(IntPtr process, IntPtr address, out MemoryBasicInformation page, UIntPtr length) {
            page = new MemoryBasicInformation { BaseAddress = new IntPtr(Memory.Base), RegionSize = new UIntPtr(0x4000), State = MemPageState.MEM_COMMIT, Protect = MemPageProtect.PAGE_READWRITE };
            return length;
        }
    }
    public class SigScanTarget {
        public byte[] Pattern;
        public SigScanTarget(string pattern) { Pattern = pattern.Split(' ').Select(s => Convert.ToByte(s, 16)).ToArray(); }
    }
    public class SignatureScanner {
        Process process; IntPtr address; int size;
        public SignatureScanner(Process p, IntPtr a, int n) { process = p; address = a; size = n; }
        public IEnumerable<IntPtr> ScanAll(SigScanTarget target) {
            byte[] bytes = process.ReadBytes(address, size);
            if (bytes == null) yield break;
            for (int i = 0; i <= bytes.Length - target.Pattern.Length; i++)
                if (target.Pattern.Select((b, j) => b == bytes[i + j]).All(b => b)) yield return address + i;
        }
    }
}
// LiveSplit passes a builder only to startup and a reader to runtime actions.
// Keep these types separate: capturing the startup builder in a callback must fail.
namespace LiveSplit.ASL {
    public class ASLSettingsBuilder {
        Settings settings;
        public ASLSettingsBuilder(Settings value) { settings = value; }
        public void Add(string id, bool enabled = true, string label = null, string parent = null) { settings.Add(id, enabled, parent); }
        public void SetToolTip(string id, string text) { }
    }
    public class ASLSettingsReader {
        Settings settings;
        public ASLSettingsReader(Settings value) { settings = value; }
        public bool this[string key] { get { return settings.Get(key); } }
    }
}
public class Settings {
    Dictionary<string, bool> values = new Dictionary<string, bool>();
    Dictionary<string, string> parents = new Dictionary<string, string>();
    public LiveSplit.ASL.ASLSettingsBuilder Builder;
    public LiveSplit.ASL.ASLSettingsReader Reader;
    public Settings() {
        Builder = new LiveSplit.ASL.ASLSettingsBuilder(this);
        Reader = new LiveSplit.ASL.ASLSettingsReader(this);
    }
    public bool this[string key] { get { return Get(key); } set { values[key] = value; } }
    public bool Get(string key) {
        bool value; string parent;
        return values.TryGetValue(key, out value) && value &&
            (!parents.TryGetValue(key, out parent) || parent == null || Get(parent));
    }
    public void Add(string id, bool enabled, string parent) { values[id] = enabled; parents[id] = parent; }
}
public class Harness {
    public Script script = new Script();
    public LiveSplitState timer = new LiveSplitState();
    public dynamic vars = new ExpandoObject(), current = new ExpandoObject(), old = new ExpandoObject();
    public Settings settings = new Settings();
    public long Now = 1000;
    public Harness(bool proxy = true, bool initialize = true) {
        Memory.Reset(proxy);
        timer.CurrentTime = new Time { RealTime = TimeSpan.Zero };
        current.Cutscene = old.Cutscene = ""; current.EventID = old.EventID = 0u;
        current.DungeonID = old.DungeonID = 0u; current.SaveBlock = 0; current.EnemyBookSize = 0;
        current.TrueEndProgression = (byte)0;
        Call("startup"); vars.loadFrequency = 1000L; vars.loadNow = (Func<long>)(() => Now);
        if (initialize) Call("init");
    }
    public dynamic Call(string name) {
        try { return script.GetType().GetMethod(name).Invoke(script, new object[] { timer, old, current, vars, Process.GetCurrentProcess(), name == "startup" ? (object)settings.Builder : settings.Reader }); }
        catch (System.Reflection.TargetInvocationException e) { throw e.InnerException; }
    }
    public long[] Sample() { return vars.readLoadSample(); }
}
