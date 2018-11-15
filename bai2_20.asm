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
mov al,80h
mov dx,300h 
lap:
push ax
mov al,0 
mov ah,1
int 16h
cmp al,27
je exit
pop ax
out dx,al
ror al,1
call delay
loop lap  
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