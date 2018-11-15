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
mov cx,5 ; Gan CX = 5
lap:
mov al,0
mov dx,300h
out dx,al
call delay
mov al,0FFh
mov dx,300h
out dx,al 
call delay
loop lap ; So lan lap tuy theo CX
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