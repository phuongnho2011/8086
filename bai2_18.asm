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
mov bx,6        ; Gan BX = 6 , vong lap led sang tuan tu 5 lan tu trai sang phai
vonglap:
sub bx,1
cmp bx,0
je nhapnhay
mov cx,8        ; Gan CX = 8  ,vong lap nhay tung led tu trai sang phai
mov al,80h
mov dx,300h  
lap:
out dx,al
shr al,1
call delay  
loop lap        ; So lan lap tuy theo CX  
loop vonglap    ; So lan lap tuy theo BX
ret
nhapnhay:
mov bx, 3       ; Gan CX = 3  ,vong lap nhap nhay 2 led giua 3 lan
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
je sangdan 
loop lapnhapnhay ; So lan lap tuy theo BX
ret 
sangdan: 
mov bx,7
vonglapsangdan:
mov al,01h
mov cx,8
mov dx,300h
sub bx,1
cmp bx,0
je exit 
lapsangdan:
out dx,al
shl al,1
add al,1 
call delay
loop lapsangdan
loop sangdan
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