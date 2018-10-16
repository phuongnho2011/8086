.model small
.stack 100h
.data

.code
  
main proc
    
    mov al, 25h
    shl al, 1
    
    mov cl, 2
    mov al, 25h
    shl al, cl
    
    mov cl, 3
    mov ax, 25h
    shl ax, cl
    
    mov ah, 4Ch
    int 21h  
    
main endp  
        
        