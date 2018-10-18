.model small
.stack 100h
.data
msg db 'Hello$'
.code
main proc
     mov ax,@data
     mov ds,ax 
     
     mov ah,08h
     int 21h
     
     cmp al,'a'
     jb next
     cmp al,'z'
     ja next
     sub al,20h
     next:
    
     mov dl,al
     mov ah,02h
     int 21h 
     
     mov ah,4Ch   
     int 21h
     main endp
     ;-----------
End main