# Uso: .\ejecutar.ps1 hola.asm  -> ensambla a .com y lo ejecuta en DOSBox-X
param([Parameter(Mandatory=$true)][string]$Archivo)
$dir  = Split-Path -Resolve (Resolve-Path $Archivo)
$base = [IO.Path]::GetFileNameWithoutExtension($Archivo)
nasm -f bin "$Archivo" -o "$dir\$base.com"
if ($LASTEXITCODE -ne 0) { exit 1 }
$dosbox = (Get-Command dosbox-x -ErrorAction SilentlyContinue).Source
if (-not $dosbox) { $dosbox = "C:\DOSBox-X\dosbox-x.exe" }
& $dosbox -c "mount c `"$dir`"" -c "c:" -c "$base.com" -c "pause"
