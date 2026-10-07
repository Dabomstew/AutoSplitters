using System;
using LiveSplit.ComponentUtil;
public class Tests {
    static int passed;
    static void Check(bool condition, string name) { if (!condition) throw new Exception(name); passed++; }
    static void Reject(Action mutation, string name) { var h = new Harness(); mutation(); Check(h.Sample() == null, name); Check(h.Call("update") == true, name + " keeps updates enabled"); }
    static void Real(Harness h, long milliseconds) {
        var time = h.timer.CurrentTime; time.RealTime = TimeSpan.FromMilliseconds(milliseconds); h.timer.CurrentTime = time;
    }
    static long Tick(Harness h, long qpc, long realMilliseconds, long completed, uint reason = 0, long opened = 0, uint coverage = 1) {
        h.Now = qpc; Real(h, realMilliseconds); Memory.Snapshot(completed, reason, opened, qpc);
        Memory.U32(Memory.Root + 12, coverage);
        h.Call("update"); h.timer.IsGameTimePaused = (bool)h.Call("isLoading");
        TimeSpan result = h.Call("gameTime");
        var time = h.timer.CurrentTime; time.GameTime = result; h.timer.CurrentTime = time;
        return result.Ticks;
    }
    static void Timing() {
        var h = new Harness(false); h.timer.Start();
        Check(Tick(h, 1500, 500, 0) == 5000000 && !h.timer.IsGameTimePaused, "absent plugin is never loading");
        h = new Harness(); h.timer.Start();
        Check(Tick(h, 1100, 100, 60) == 400000, "short load wholly between polls");
        Check(!h.timer.IsGameTimePaused, "completed short load does not pause interpolation");
        Check(Tick(h, 1200, 200, 100) == 1000000, "multiple completed loads accumulate once");
        Check(Tick(h, 1500, 500, 100, 1, 1300) == 2000000 && h.timer.IsGameTimePaused, "open interval freezes game time");
        Check(Tick(h, 1600, 600, 100, 1, 1300) == 2000000, "load continuation is not double subtracted");
        Check(Tick(h, 1700, 700, 400) == 3000000 && !h.timer.IsGameTimePaused, "closing interval resumes time");
        h.settings["loadremoval"] = false;
        Check(Tick(h, 1800, 800, 400, 1, 1700) == 4000000 && !h.timer.IsGameTimePaused, "disabling preserves prior deductions and advances");
        h.settings["loadremoval"] = true;
        Check(Tick(h, 1900, 900, 600) == 5000000, "reenabling rebases unknown interval");
        Check(Tick(h, 2000, 1000, 650) == 5500000, "reenabling counts new intervals");

        h = new Harness(); h.timer.Start();
        Tick(h, 1100, 99, 100); // Different read instants can jitter relative to Real Time.
        Check(Tick(h, 1200, 200, 200) == 0, "cumulative loads do not lose time to per-poll clock jitter");

        h = new Harness(); Memory.Snapshot(5000, 1, 900, 1000); Real(h, -1430); h.timer.Start();
        Check(Tick(h, 1200, -1230, 5300) == -14300000, "start clips a preexisting load and preserves timer offset");
        h.timer.CurrentPhase = LiveSplit.Model.TimerPhase.NotRunning; h.Call("onReset"); Real(h, 0); h.timer.Start();
        Check(Tick(h, 1300, 100, 5300) == 1000000, "manual reset/start clears old run deductions");

        h = new Harness(); h.timer.Start();
        Check(Tick(h, 1500, 500, 0, 1, 1000) == 0, "load before manual pause");
        h.Now = 1700; Real(h, 600); Memory.Snapshot(0, 1, 1000, 1700); h.timer.Pause();
        Check((decimal)h.vars.loadRemovedTicks == 6000000m, "pause callback caps deduction at frozen Real Time");
        Check(Tick(h, 2600, 600, 0, 1, 1000) == 0 && !h.timer.IsGameTimePaused, "paused timer does not double deduct load");
        h.Now = 2800; Memory.Snapshot(0, 1, 1000, 2800); h.timer.Resume();
        Check(Tick(h, 3000, 800, 0, 1, 1000) == 0, "resume excludes only running suffix");
        Check(Tick(h, 3200, 1000, 2100) == 1000000, "pause-spanning load closes correctly");

        h = new Harness(); h.timer.Start(); Tick(h, 1500, 500, 0, 1, 1000);
        h.Now = 1600; Real(h, 600); Memory.U32(Memory.Root + 8, 2); h.Call("update");
        Check(h.Call("isLoading") == false && ((TimeSpan)h.Call("gameTime")).Ticks == 1000000, "fault releases previous loading immediately");
        Check(Tick(h, 1800, 800, 800) == 3000000, "fault recovery does not deduct missing gap");
        Check(Tick(h, 1900, 900, 850) == 3500000, "new valid intervals work after recovery");
        Check(Tick(h, 2000, 1000, 10000) == 4500000 && !h.timer.IsGameTimePaused, "impossible counter jump fails open");
        h.timer.IsGameTimePaused = true; h.Call("exit");
        Check(!h.timer.IsGameTimePaused, "process exit releases Game Time");
        Memory.Reset(true); h.Call("init");
        Check(Tick(h, 2100, 1100, 0) == 5500000, "process restart rebases while keeping prior deductions");
        h.timer.IsGameTimePaused = true; h.Call("shutdown");
        Check(!h.timer.IsGameTimePaused, "script shutdown releases Game Time");
        decimal removed = h.vars.loadRemovedTicks; h.timer.Pause(); h.timer.Resume(); h.timer.Start();
        Check((decimal)h.vars.loadRemovedTicks == removed, "shutdown removes timer handlers");

        h = new Harness(); h.timer.Start(); Tick(h, 1500, 500, 200);
        h.Call("shutdown"); h.Call("startup"); h.vars.loadFrequency = 1000L; h.vars.loadNow = (Func<long>)(() => h.Now); h.Call("init");
        Check(Tick(h, 1600, 600, 200) == 4000000, "reload preserves accumulated Game Time offset");

        h = new Harness(); h.vars.loadFrequency = 3L; Memory.I64(Memory.Root + 56, 3); h.timer.Start();
        for (int i = 1; i <= 3; i++) {
            h.Now = 1000 + i; Memory.I64(Memory.Root + 64, i); Memory.I64(Memory.Root + 80, h.Now);
            h.timer.CurrentTime = new LiveSplit.Model.Time { RealTime = TimeSpan.FromTicks(i * 3333334L) }; h.Call("update");
        }
        Check(((TimeSpan)h.Call("gameTime")).Ticks == 2, "fractional QPC conversion retains precision");
    }
    static void SettingsLifecycle() {
        var h = new Harness(true, false);
        h.timer.Start(); h.timer.Pause(); h.timer.Resume();
        Check(h.Call("update") == false, "timer callbacks before init do not access startup settings");
        h.settings["loadremoval"] = false; h.Call("init"); h.timer.Start();
        Check(Tick(h, 1100, 100, 100) == 1000000 && !h.timer.IsGameTimePaused,
            "saved disabled setting is read before first update");
        Check(Memory.StateReads == 0, "disabled setting prevents bridge reads in start callback and update");
        h.settings["loadremoval"] = true;
        Check(Tick(h, 1200, 200, 200) == 2000000, "runtime reader sees setting enabled after init");
        Check(Tick(h, 1300, 300, 250) == 2500000, "enabled reader counts subsequent loads");
        h.settings["loadremoval"] = false;
        h.Now = 1350; Real(h, 350); Memory.Snapshot(300, 0, 0, h.Now); h.timer.Pause();
        Check((decimal)h.vars.loadRemovedTicks == 500000m, "pause callback sees settings changed between updates");
        h.settings["loadremoval"] = true; h.timer.Resume();
        Check(Tick(h, 1450, 450, 350) == 3500000, "resume callback reads current runtime setting and rebases");
    }
    static void ExistingSplits() {
        var h = new Harness(false); h.settings["startngplus"] = true;
        h.current.EventID = 10u; Check(h.Call("start") == true, "ADV NG+ without New Game bridge");
        h.current.Cutscene = "Clear Data"; h.Call("update"); h.current.EventID = 1u;
        Check(h.Call("start") == false, "Clear Data cancels next NG event");
        h.current.EventID = 10u; Check(h.Call("start") == true, "Clear Data still permits NG+");
        h = new Harness(false); h.current.SaveBlock = 0x30000000; h.current.EnemyBookSize = 1;
        long enemy = 0x30000000 + 0xA027C;
        Memory.Put(enemy, new byte[8]); Memory.Put(enemy, BitConverter.GetBytes((ushort)120));
        h.timer.Start(); h.Call("update"); Memory.U32(enemy + 4, 2);
        Check(h.Call("split") != true, "Hi-Metal Guarders threshold preserved");
        Memory.U32(enemy + 4, 3); Check(h.Call("split") == true, "enemy split works without plugin");
        Check(h.Call("split") != true, "enemy split remains once per run");
        h = new Harness(false); h.timer.Start(); h.Call("update");
        h.current.TrueEndProgression = (byte)1; Check(h.Call("split") == true, "true-end progression without plugin");
        h.current.TrueEndProgression = (byte)0; h.current.DungeonID = 701u; h.settings["dungeon-701"] = true;
        Check(h.Call("split") == true, "dungeon split without plugin");
        Check(h.Call("split") != true, "dungeon split remains once per run");
        h.current.Cutscene = "Further Into Delusion";
        Check(h.Call("split") == true, "ending cutscene without plugin");
        h = new Harness(false); h.Sample(); int reads = Memory.ModuleReads; h.Sample();
        Check(Memory.ModuleReads == reads, "absent plugin scan throttled");
        Memory.Modules.Add(new ProcessModuleWow64Safe { ModuleName = "dinput8.dll", BaseAddress = new IntPtr(Memory.Base), ModuleMemorySize = 0x4000 });
        h.Now += 1000; Memory.Snapshot(0, 0, 0, h.Now);
        Check(h.Sample() != null, "late plugin discovery");
    }
    public static void Main() {
        SettingsLifecycle();
        var h = new Harness(false);
        Check(h.Sample() == null, "no plugin");
        Check(h.Call("update") == true, "no plugin does not block update");
        h.current.EventID = 1u;
        Check(h.Call("start") == true, "ADV New Game without plugin");
        h.timer.Start(); h.Call("update"); h.current.EventID = 11010u; h.settings["event-11010"] = true;
        Check(h.Call("split") == true, "event split without plugin");
        h = new Harness(); Check(h.Sample()[1] == 0, "idle bridge");
        h.Now = 2000; Memory.Snapshot(200, 1, 1500, 1900);
        Check(h.Sample()[1] == 700 && h.Sample()[2] == 1, "coherent open interval");
        Memory.Snapshot(800, 0, 0, 2000);
        Check(h.Sample()[1] == 800 && h.Sample()[2] == 0, "closed interval retained between polls");
        Memory.I64(Memory.Root + 64, 1L << 40);
        Check(h.Sample()[1] == 1L << 40, "64-bit count");
        Reject(() => Memory.U32(Memory.Marker + 8, 2), "unsupported ABI");
        Reject(() => Memory.U32(Memory.Marker + 20, 120), "unsupported size");
        Reject(() => Memory.U32(Memory.Marker + 16, 4), "nonresident root");
        Reject(() => Memory.U32(Memory.Marker + 16, (uint)Memory.Root + 1), "unaligned root");
        Reject(() => Memory.U32(Memory.Root + 8, 0), "disabled plugin");
        Reject(() => Memory.U32(Memory.Root + 8, 2), "faulted plugin");
        Reject(() => Memory.U32(Memory.Root + 36, 4), "fault code");
        Reject(() => Memory.U32(Memory.Root + 12, 64), "unknown coverage");
        Reject(() => Memory.I64(Memory.Root + 56, 1), "wrong QPC frequency");
        Reject(() => Memory.Snapshot(0, 1, 1, 100), "stale active state");
        Reject(() => { Memory.Snapshot(0, 1, 500, 1000); Memory.U32(Memory.Root + 32, 0); }, "unfocused active state");
        Reject(() => Memory.I64(Memory.Root + 64, -1), "overflowed native total");
        Reject(() => Memory.Put(Memory.Marker + 64, System.Text.Encoding.ASCII.GetBytes("VIILT001")), "ambiguous marker");
        h = new Harness(); Memory.U32(Memory.Root, 5);
        Check(h.Sample() == null && Memory.StateReads == 8, "odd publication retries bounded");
        h = new Harness();
        Memory.BeforeRead = (address, size) => { if (address.ToInt64() == Memory.Root && size == 112) Memory.U32(Memory.Root, (uint)(100 + Memory.StateReads * 2)); };
        Check(h.Sample() == null, "torn publication never accepted");
        h = new Harness(); h.Sample(); Memory.Bytes.Remove(Memory.Root);
        Check(h.Sample() == null && h.Call("update") == true, "unreadable root fails open");
        h.Call("exit"); Check(h.Sample() == null, "process exit drops reader");
        for (uint coverage = 1; coverage <= 63; ++coverage) {
            h = new Harness(); h.Now = 2000; Memory.Snapshot(200, coverage, 1500, 1900);
            Memory.U32(Memory.Root + 12, coverage);
            Check(h.Sample()[1] == 700 && h.Sample()[2] == coverage, "known load-reason union mask");
        }
        Reject(() => Memory.U32(Memory.Root + 12, 0), "empty coverage");
        Reject(() => { Memory.Snapshot(0, 2, 500, 1000); }, "reason outside coverage");
        Reject(() => { Memory.Snapshot(0, 8, 500, 1000); Memory.U32(Memory.Root + 12, 7); }, "unknown reason");
        ExistingSplits();
        Timing();
        var queue = new Harness(); queue.timer.Start();
        Memory.U32(Memory.Root + 40, 0); // Native FPS request is off.
        Check(Tick(queue, 1500, 500, 0, 4, 1200, 63) == 2000000 && queue.timer.IsGameTimePaused,
              "ADV queue reason removes open load with FPS unlock off");
        Check(Tick(queue, 1600, 600, 300, 0, 0, 63) == 3000000 && !queue.timer.IsGameTimePaused,
              "completed ADV queue load retained after resume");
        Console.WriteLine("PASS: " + passed + " Megadimension ASL checks");
    }
}
