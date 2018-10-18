.model small
.stack 100h
.data
msg db 'Hello$'
.code
main proc
     mov ax,@data
     mov ds,ax 
     
     lop:
     mov ah,08h
     int 21h
     
     cmp al,27
     je exit
 
     cmp al,'a'
     jb lop
     cmp al,'z'
     ja lop
     sub al,20h
     mov dl,al
     mov ah,02h
     int 21h 
     jmp lop
     
     exit:
    
     
     
     mov ah,4Ch   
     int 21h
     main endp
     ;-----------
End main