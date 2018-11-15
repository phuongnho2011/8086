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
mov al,00h ; Ngat RL1
mov dx,303h
out dx,al
call delay
mov al,02h ; Ngat RL2
mov dx,303h
out dx,al
call delay
mov al,04h ; Ngat RL3
mov dx,303h
out dx,al
call delay
mov al,05h ; Dong RL3
mov dx,303h
out dx,al
call delay
mov al,03h ; Dong RL2
mov dx,303h
out dx,al
call delay
mov al,01h ; Dong RL1
mov dx,303h
out dx,al
call delay
exit:
mov ah,4Ch
int 21h
main endp
;--------------------------------------------
delay proc
push cx
mov cx,0FFh
loop $
pop cx
ret
delay endp
END main