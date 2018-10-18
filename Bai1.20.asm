.model small
.stack 100h
.data
     msg db 'Hello$'
.code
main proc
     mov ax,data
     mov ds,ax
     mov dh,0
     mov si,0
lap:
     mov ch,msg[si]
     cmp ch,'$'
     je exit 
     mov dl,10
     mov ah,02h
     int 10h
     mov dl,ch
     int 21h
     inc dh
     inc si
     
     jmp lap 
     
     exit:
     
     mov ah,4Ch
     int 21h
     main endp
end main