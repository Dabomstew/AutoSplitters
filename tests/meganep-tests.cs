using System;
using LiveSplit.ComponentUtil;
public class Tests {
    static int passed;
    static void Check(bool condition, string name) { if (!condition) throw new Exception(name); passed++; }
    static void Reject(Action mutation, string name) { var h = new Harness(); mutation(); Check(h.Sample() == null, name); Check(h.Call("update") == true, name + " keeps updates enabled"); }
    public static void Main() {
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
        Reject(() => Memory.U32(Memory.Root + 12, 3), "unknown coverage");
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
        Console.WriteLine("PASS: " + passed + " Megadimension ASL checks");
    }
}
