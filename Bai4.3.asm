#start=adc.exe#
.model small
.stack 100h
.data
msg db 'Gia tri nhap tu ADC:$'
.code
main proc
mov ax,@data
mov ds,ax
mov ax,02h
int 10h
mov ah,02h
mov dx,0101h
int 10h
mov ah,09h
lea dx,msg
int 21h
mov al,90h
mov dx,303h
out dx,al
begin:
mov ah,0Bh
int 21h
cmp al,0FFh
je exit
mov dx,300h
in al,dx
push ax
cmp al,153
ja sangleddo
pop ax
cmp al,102
jb sangledxanh
mov al,2
mov dx,301h
out dx,al
mov dx,0116h
mov ah,02h
mov bh,0
int 10h
jmp begin
sangleddo:
mov al,1
mov dx,301h
out dx,al
jmp begin
sangledxanh:
mov al,4
mov dx,301h
out dx,al
jmp begin
exit:
mov ah,4Ch
int 21h
main endp

                        