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
mov al,1
mov dx,300h
out dx,al
mov al,2
mov dx,301h
out dx,al
mov al,3
mov dx,302h
out dx,al
mov al,4
mov dx,303h
out dx,al
mov ah,4Ch
int 21h
main endp
END main