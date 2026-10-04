param([string]$Compiler = "$env:WINDIR\Microsoft.NET\Framework\v4.0.30319\csc.exe")
$ErrorActionPreference = 'Stop'
$repo = Split-Path $PSScriptRoot -Parent
$output = Join-Path $PSScriptRoot 'output'
New-Item -ItemType Directory -Force -Path $output | Out-Null
$source = [IO.File]::ReadAllText((Join-Path $repo 'meganep.asl'))
$actions = [regex]::Matches($source, '(?ms)^(startup|shutdown|init|exit|update|start|split|reset|isLoading|gameTime|onStart|onReset)\s*\r?\n\{(.*?)^\}')
if ($actions.Count -lt 7) { throw 'ASL action extraction failed' }
$generated = @'
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using LiveSplit.ComponentUtil;
using LiveSplit.Model;
public class Script {
    public string version;
    public double refreshRate;
    void print(string message) { }
'@
foreach ($action in $actions) {
    $name = $action.Groups[1].Value
    $body = $action.Groups[2].Value.Replace('return;', 'return null;')
    $generated += [Environment]::NewLine + "public dynamic $name(LiveSplitState timer, dynamic old, dynamic current, dynamic vars, Process game, dynamic settings) {" + [Environment]::NewLine
    $generated += "var memory = game; var modules = game != null ? game.ModulesWow64Safe() : null;" + [Environment]::NewLine + $body + [Environment]::NewLine + "return null; }" + [Environment]::NewLine
}
$generated += "}" + [Environment]::NewLine
[IO.File]::WriteAllText((Join-Path $output 'meganep.generated.cs'), $generated, [Text.UTF8Encoding]::new($false))
& $Compiler /nologo /warn:4 /nowarn:0162,0219 /platform:x86 /r:System.Core.dll /r:Microsoft.CSharp.dll /r:System.Windows.Forms.dll "/out:$output\meganep-tests.exe" "$output\meganep.generated.cs" "$PSScriptRoot\meganep-host.cs" "$PSScriptRoot\meganep-tests.cs"
if ($LASTEXITCODE -ne 0) { throw 'ASL C# compilation failed' }
& "$output\meganep-tests.exe"
if ($LASTEXITCODE -ne 0) { throw 'ASL regression tests failed' }
