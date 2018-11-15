.model small
.stack 100h

.data
msg db 'Hello$'

.code 

main proc
    
    mov ax, @data
    mov ds, ax
    mov ax, 02h
    int 10h
    
    mov ah, 09h
    lea dx, msg
    int 21h
    
    mov ah,4Ch
    int 21h
    
main endp  
;-------------
End main
        