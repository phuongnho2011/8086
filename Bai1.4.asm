.model small
.stack 100h
.data

.code  

main proc
    int 10h
    mov ax, 5623h
    mov bh, 14h
    div bh
main endp