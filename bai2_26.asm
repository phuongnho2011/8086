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
cmp al,01110000b
je sw1
cmp al,10110000b
je sw2
cmp al,11010000b
je sw3
cmp al,11100000b
je sw4
jmp begin
sw1:  
mov al,01h ; Dong RL1
mov dx,303h
out dx,al
call delay 
mov bx,11 
lapsw1:
mov al,0Ch
mov dx,303h
out dx,al
call delay
mov al,0Dh
mov dx,303h
out dx,al
call delay 
sub bx,1
cmp bx,0
je begin
call delay
jmp lapsw1 
sw2:
mov al,03h ; Dong RL2
mov dx,303h
out dx,al
call delay 
mov bx,6 
lapsw2:
mov al,0Ch
mov dx,303h
out dx,al
call delay
mov al,0Dh
mov dx,303h
out dx,al
call delay 
sub bx,1
cmp bx,0
je begin
call delay
jmp lapsw2 
sw3:
mov bx, 6       ; Gan bX = 3  ,vong lap nhap nhay 2 led giua 3 lan
lapnhapnhay:
mov al,81h
mov dx,300h 
out dx,al 
call delay 
mov al,0h
mov dx,300h 
out dx,al 
call delay
sub bx,1
cmp bx,0
je begin
loop lapnhapnhay ; So lan lap tuy theo BX
sw4:
mov al,00h
mov dx,300h 
out dx,al 
mov al,00h ; Ngat RL1
mov dx,303h
out dx,al
call delay
mov al,02h ; Ngat RL2
mov dx,303h
out dx,al
call delay
jmp exit
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