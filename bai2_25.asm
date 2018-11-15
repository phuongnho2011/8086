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
mov cx,8
mov al,80h
mov dx,300h  
lap:
out dx,al
shr al,1
call delay  
loop lap        ; So lan lap tuy theo CX  
jmp begin
sw2:
mov bx, 3       ; Gan bX = 3  ,vong lap nhap nhay 2 led giua 3 lan
lapnhapnhay:
mov al,18h
mov dx,300h 
out dx,al 
call delay 
mov al,0h
mov dx,300h 
out dx,al 
call delay
sub bx,1
cmp bx,0
jmp begin 
loop lapnhapnhay ; So lan lap tuy theo BX     
jmp begin
sw3:
mov al,00h
mov dx,300h 
out dx,al 
call delay 
mov al,081h
mov dx,300h 
out dx,al 
call delay 
mov al,0C3h
mov dx,300h 
out dx,al 
call delay
mov al,0E7h
mov dx,300h 
out dx,al 
call delay
mov al,0FFh
mov dx,300h 
out dx,al 
call delay 
mov al,0E7h
mov dx,300h 
out dx,al 
call delay
mov al,0C3h
mov dx,300h 
out dx,al 
call delay
mov al,081h
mov dx,300h 
out dx,al 
call delay 
mov al,00h
mov dx,300h 
out dx,al 
call delay 
jmp begin
sw4:
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