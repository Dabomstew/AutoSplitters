# Megadimension optional load removal

`meganep.asl` retains its ADV-ID New Game / NG+ detection and existing split
conditions. VII Speedrun Patch is optional; its separate New Game bridge is
not used. Without compatible working load data, `isLoading` returns false,
Game Time keeps advancing, and normal starts and splits remain available.

## Setup and current coverage

Use Game Time in LiveSplit to see load removal. The script setting
**Remove supported loads (optional plugin, experimental)** defaults on. The
native patch must separately have `[Patches] LoadTiming=1`; its current
coverage is **battle-entry character resource waits only**, not all game
loads. Ordinary playable background spawning, cameras and ADV playback
are not removed by this detector.

The optional native `[LoadTiming] FPSUnlock=1` uses the same detector and
needs no ASL change. The ASL only reads memory; it never changes the FPS
setting, game memory or the installed patch.

## Timing and recovery

The reader finds the unique VIILT001 ABI 1 descriptor in readable dinput8.dll
pages, validates its resident root and coverage, and accepts a snapshot only
between matching even publication sequences. It reads completed and open QPC
intervals cumulatively, including loads shorter than a polling interval.
Discovery retries at most once per second; coherent-read retries are bounded.

Game Time is Real Time minus valid run-local cumulative load duration.
`isLoading` only controls interpolation between these explicit updates; it
does not add a second deduction. Negative start offsets remain supported.
Manual/automatic starts and resets establish fresh anchors. Manual pauses
collect the running prefix, and resume establishes a fresh baseline so time
spent paused is not removed twice. Script reload preserves the existing Game
Time offset. Process restart discards process-specific anchors.

Missing, disabled, incompatible, faulted, stale, ambiguous or unreadable
plugin data releases loading immediately. Previously validated deductions
are retained; unknown gaps are counted and recovery starts from a fresh
sample. Disabling/re-enabling the script setting follows the same policy.
Exit/shutdown releases any Game Time pause and removes event handlers.
The script does not force the selected timing method or reset the run.

## Validation

Run `powershell -ExecutionPolicy Bypass -File tests/test-meganep.ps1` on Windows
with .NET Framework 4 installed. It compiles the actual action bodies from
meganep.asl using the Framework C# compiler and a deterministic memory/timer
host. Tests cover optional-plugin fallback, coherent 64-bit snapshots,
short/open loads, start/reset/pause/resume, toggles, failure recovery,
reconnect/reload, fractional ticks and existing start/split rules.
Generated executables and extracted action code stay in ignored tests/output.
The current suite passes 78 checks, including independent-clock sampling
jitter (ordinary polls retain the entire native cumulative delta; only the
manual-pause boundary is clipped). Additional local validation compiled the
ASL against actual LiveSplit ComponentUtil sources and exercised real Windows
module discovery / ReadProcessMemory with absent, disabled, completed, open
and faulted states in an isolated test process. This is not a full LiveSplit
UI or live-game test.

Action order and interpolation follow the
[official ASL documentation](https://github.com/LiveSplit/LiveSplit.AutoSplitters#timer-control).
