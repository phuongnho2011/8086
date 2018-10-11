.model small
.stack 100h
.data
    
.code 

main proc
    int 10h
    mov al,15h
    mov ah,41h
    mul ah
    mov ax,154h
    mov dx,289h
    mul dx
main endp
    
    