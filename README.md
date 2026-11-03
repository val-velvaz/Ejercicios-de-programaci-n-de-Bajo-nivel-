# Ensamblador 8086 en VS Code

1. Abre PowerShell en esta carpeta y ejecuta: `powershell -ExecutionPolicy Bypass -File .\instalar.ps1`
2. Abre la carpeta en VS Code, instala la extensión recomendada y abre `hola.asm`.
3. Ctrl+Shift+B ensambla con NASM y lo ejecuta en DOSBox-X.

## Diferencias frente a emu8086 (sintaxis MASM/TASM -> NASM)
| emu8086 | NASM |
|---|---|
| `.model small` / `.stack` / `.data` / `.code` | `org 100h` + `section .text` / `section .data` |
| `mov dx, offset msg` | `mov dx, msg` |
| `msg db 'Hola$'` | igual |
| `mov al, [var]` con `var db ?` | `var db 0` (NASM no usa `?`; usa `resb 1`) |
| `proc`/`endp` | etiquetas (`nombre:`) |
| `end main` | no se usa |
| tamaño con `byte ptr`/`word ptr` | `byte`/`word` |

Depurar paso a paso: DOSBox-X trae depurador (menú Debug > Start DOSBox-X Debugger) que muestra AX, BX, flags, etc.
