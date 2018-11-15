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
lap:
mov al,0 ; Sang 8 Led
mov dx,300h  
out dx,al
call delay
mov al,0FFh ; Tat 8 Led
mov dx,300h
out dx,al
call delay
jmp lap
exit:
mov ah,4Ch
int 21h
main endp
;-------------------------
delay proc
push cx
mov cx,0Fh
loop $
pop cx
ret
delay endp
end main