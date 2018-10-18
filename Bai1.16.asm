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
     push ax
     
     mov ah,02h
     mov dx,0B0Ah
     int 10h
     
     pop ax
     mov dl,al
     mov ah,02h
     int 21h 
     
     mov ah,4Ch   
     int 21h
     main endp
     ;-----------
End main