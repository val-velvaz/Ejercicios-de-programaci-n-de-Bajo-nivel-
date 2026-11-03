org 100h 
jmp inicio 
var1 db 5 dup(6)
var2 db 2 dup(1, 2, 3,)
var3 db 3
var4 db 7 

inicio: 
    mov al, var1 
    mov bx, var2 
    mov cx, var3 

ret 