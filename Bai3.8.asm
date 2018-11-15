#start=led7seg.exe# 
.model small 
.stack 100h 
.data
.code 
main proc
mov ax,@data 
mov ds,ax
mov ax,02h
int 10h
mov cx,0000
lap:
mov ax,cx
call XuatLED
add cx,1
cmp cx,2345
jbe lap
mov ah,4Ch
int 21h
main endp
XuatLED proc
mov dx,0
mov bx,1000
div bx
push dx
mov dx,300h
out dx,al
pop dx
mov ax,dx
mov dx,0
mov bx,100
div bx
push dx
mov dx,301h
out dx,al
pop dx
mov ax,dx
mov dx,0
mov bx,10
div bx
push dx
mov dx,302h
out dx,al
pop dx
mov ax,dx
mov dx,303h
out dx,al
ret
XuatLED endp
END main