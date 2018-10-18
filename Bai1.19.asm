.model small
.stack 100h
.data
     msg db 'Hello$'
.code
main proc
     mov ax,data
     mov ds,ax
     mov si,0
lap:
     mov dl,msg[si]
     cmp dl,'$'
     je exit
     mov ah,02h
     int 21h
     inc si
     jmp lap 
     
     exit:
     
     mov ah,4Ch
     int 21h
     main endp
end main