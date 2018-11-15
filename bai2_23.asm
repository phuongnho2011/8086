#start=8255.exe#
.model small
.stack 100h
.data
.code
main proc
mov ax,@data
mov ds,ax
mov al,82h
mov dx,303h
out dx,al
lap:
mov al,0Ch
mov dx,303h
out dx,al
call delay
mov al,0Dh
mov dx,303h
out dx,al
call delay
jmp lap
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