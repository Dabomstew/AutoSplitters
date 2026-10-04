# Megadimension optional load timing

The live script keeps its ADV-ID New Game / NG+ detection and all existing
split conditions independent of VII Speedrun Patch. The optional reader
recognizes the VIILT001 ABI 1 descriptor in dinput8.dll. It follows only its
resident scalar state, validates partial coverage, and brackets each snapshot
with matching even publication sequences. No game memory is written.

Missing, disabled, incompatible, faulted, stale, ambiguous or unreadable
plugin data returns no sample and never disables normal script updates.
Discovery retries at most once per second; snapshot retries are bounded.
Only battle-entry character resource waits are qualified by the current
native plugin. The New Game bridge is not used.

## Validation

Run `powershell -ExecutionPolicy Bypass -File tests/test-meganep.ps1` on Windows
with .NET Framework 4 installed. It compiles the actual action bodies from
meganep.asl using the Framework C# compiler and runs a deterministic memory /
timer host. It covers absence, unsupported ABI, fault and stale data, coherent
64-bit open/completed counters, torn reads and plugin-free start/event splits.
Generated executables and extracted action code stay in ignored tests/output.
This harness is not a full LiveSplit UI or live-game test.

Reader foundation added first; cumulative Game Time integration follows in
the next implementation step.
