# Uso: .\ejecutar.ps1 archivo.asm  -> ensambla a .com y lo ejecuta en DOSBox-X
param([Parameter(Mandatory=$true)][string]$Archivo)
$full = (Resolve-Path $Archivo).Path
$dir  = Split-Path $full
$base = [IO.Path]::GetFileNameWithoutExtension($full)
nasm -f bin "$full" -o "$dir\prog.com"
if ($LASTEXITCODE -ne 0) { exit 1 }
$dosbox = (Get-Command dosbox-x -ErrorAction SilentlyContinue).Source
if (-not $dosbox) { $dosbox = "C:\DOSBox-X\dosbox-x.exe" }
# Config temporal: monta SOLO la carpeta del programa como unidad C:
$conf = Join-Path $env:TEMP "asm8086.conf"
@(
  "[autoexec]",
  "@echo off",
  "mount c `"$dir`"",
  "c:",
  "prog.com",
  "pause",
  "exit"
) | Set-Content -Path $conf -Encoding ASCII
& $dosbox -conf $conf -nopromptfolder
