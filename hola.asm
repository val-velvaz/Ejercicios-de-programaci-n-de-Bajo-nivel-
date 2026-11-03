; Ejemplo 8086 de 16 bits (NASM, formato .COM para DOS)
org 100h

section .text
start:
    mov ah, 09h          ; DOS: imprimir cadena terminada en '$'
    mov dx, msg
    int 21h

    mov ax, 5            ; AX = 5
    mov bx, 3            ; BX = 3
    add ax, bx           ; AX = 8

    mov ah, 4Ch          ; DOS: terminar programa
    int 21h

section .data
msg db 'Hola, 8086!', 0Dh, 0Ah, '$'
