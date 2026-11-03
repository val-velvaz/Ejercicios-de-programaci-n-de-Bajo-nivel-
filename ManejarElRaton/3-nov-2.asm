org 100h 
nop
hola:
nop
nop
mov al,3 
mov bl,4 
add al,bl 
cmp al,7    ; Bandera = al- 7
            ; si es 0 se activa la bandera
jp hola     ; por qué cambio jz a jp? 
ret