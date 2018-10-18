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
     
     mov ah,0Ah
     lea dx,msg
     int 21h
     mov si,2
lap: 
     mov dl,msg[si]
     cmp dl,13
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