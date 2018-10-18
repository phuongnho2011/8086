.model small
.stack 100h

.data
msg db 'Hello$'

.code 

main proc
       
    mov ax, @data
    mov ds, ax
    
    mov dh, 10
    mov dl, 10
    mov bh, 0
    mov ah, 02h
    int 10h
    
    mov ah, 09h 
    lea dx, msg 
    int 21h
   
    
           
    exit:  
    mov ah, 4Ch
    int 21h
    
main endp  
;-------------
End main
        