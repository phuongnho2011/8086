.model small
.stack 10h
.data

msg db 101
    db ?
    db 101 dup(?)
.code

main proc  
    
    
    mov ax,@data
    mov ds,ax
    mov ax,02h
    int 10h
    mov ah,0ah
    lea dx,msg
    int 21h
    mov si,1
    mov al,msg[si]
    mov ah,0
    mov si,ax
    
    mov al,'$'
    mov msg[si],al  
    
    mov ah,09h
    lea dx,msg
    add dx,2
    int 21h
    
    exit:
        mov ah,4ch
        int 21h
main endp
end main
