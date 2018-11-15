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
begin:
mov dx,301h
in al,dx
and al,0F0h
cmp al,10110000b
je sw1
cmp al,11010000b
je sw2
cmp al,11100000b
je sw3
cmp al,01110000b
je sw4
jmp begin
sw1:
mov al,0Fh
mov dx,300h
out dx,al
call delay
mov al,0
mov dx,303h
out dx,al
call delay
mov al,2
out dx,al
call delay
mov al,4
out dx,al
jmp begin
sw2:
mov al,0F0h
mov dx,300h
out dx,al
call delay
mov al,1
mov dx,303h
out dx,al
call delay
mov al,3
out dx,al
call delay
mov al,5
out dx,al
jmp begin
sw3:
jmp exit
sw4:
mov al,3Ch
mov dx,300h
out dx,al
jmp begin
exit:
mov ah,4Ch
int 21h
main endp
;--------------------------------------------
delay proc
push cx
mov cx,0Fh
loop $
pop cx
ret
delay endp