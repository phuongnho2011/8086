.model small
.stack 100h
.data
     msg db 'Hello$'
.code
main proc
     mov ax,data
     mov ds,ax
     mov dh,1
     mov ch,40
     mov si,0
lap:
     mov cl,msg[si]
     cmp cl,'$'
     je exit
     mov dl,ch 
     mov ah,02h
     int 10h
     mov dl,cl
     int 21h
     dec ch
     inc dh
     inc si
     
     jmp lap 
     
     exit:
     
     mov ah,4Ch
     int 21h
     main endp
end main