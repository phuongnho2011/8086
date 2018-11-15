#start=8255.exe#
.model small
.stack 100h
.data
.code
main proc
mov ax,@data
mov ds,ax
mov ax,02h
int 10h
mov al,82h
mov dx,303h
out dx,al
mov al,81h ; Sang Led 7
mov dx,300h
out dx,al
call delay
mov al,0C3h ; Sang Led 6
mov dx,300h
out dx,al
call delay
mov al,0E7h ; Sang Led 5
mov dx,300h
out dx,al
call delay    
mov al,0FFh ; Sang Led 4
mov dx,300h
out dx,al
call delay
mov dx,300h
out dx,al
call delay
exit:
mov ah,4Ch
int 21h
main endp
delay proc
push cx
mov cx,0Fh
loop $
pop cx
ret
delay endp
end main