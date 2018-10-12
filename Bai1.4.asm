.model small
.stack 100h
.data

.code  

main proc 
    
    mov ax, 5623h
    mov bx, 14h
    div bx      ; quotient = 44E and remainder = 0B
    
    mov dx, 0321h
    mov ax, 9154h
    mov bx, 9Ah
    div bx      ; this division is overflow
    
    mov ah, 4Ch
    int 21h
    
main endp