.model small
.stack 100h
.data

.code
  
main proc
    
    mov al, 25h
    shr al, 1
    
    mov cl, 2
    mov al, 25h
    shr al, cl
    
    mov cl, 3
    mov ax, 25h
    shr ax, cl
    
    mov ah, 4Ch
    int 21h  
    
main endp  
        
        