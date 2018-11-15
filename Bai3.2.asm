#start=ioport.exe#
.model small
.stack 100h
.data  

msg db 'Gia tri nhap:$'
msg1 db 'Gia tri xuat:$'
msg2 db 'Nhan ''N'' de nhap gia tri, ''X'' de xuat gia tri, ESC de thoat$'

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
 
mov ah,02h
mov dx,0201h
int 10h 
 
mov ah,09h
lea dx,msg1
int 21h  
 
mov ah,02h
mov dx,0D01h
int 10h  
 
mov ah,09h
lea dx,msg2
int 21h
 
begin:     

mov ah,08h
int 21h
cmp al,'N'
je Nhap
cmp al,'n'
je Nhap
cmp al,'X'
je Xuat
cmp al,'x'
je Xuat
cmp al,27
je exit 
jmp begin 
   
Nhap:

mov dx,202h
in al,dx
mov dx,010Eh  
mov ah,02h
mov bh,0
int 10h
call Xuatthapphan
jmp begin
    
Xuat:

mov dx,020Eh 
mov ah,02h
mov bh,0
int 10h
call Nhapthapphan  
mov dx,302h
out dx,al
jmp begin
   
exit:
mov ah,4Ch
int 21h
main endp

Xuatthapphan proc
mov ah,0
mov bl,100
div bl
push ax
mov dl,al
add dl,'0'
mov ah,02h
int 21h
pop ax
mov al,ah
mov ah,0
mov bl,10
div bl
push ax
mov dl,al
add dl,'0'
mov ah,02h
int 21h
pop ax
mov dl,ah
add dl,'0'
mov ah,02h
int 21h
ret
Xuatthapphan endp 
     ;----------     
Nhapthapphan proc
mov ah,01h
int 21h
sub al,'0'
mov ah,0
mov bl,100
mul bl
mov bh,al
mov ah,01h
int 21h
sub al,'0'
mov ah,0
mov bl,10
mul bl
add bh,al
mov ah,01h
int 21h
sub al,'0'
add al,bh
ret
Nhapthapphan endp
END main

; Moi vao nhap nut 'N' thi chuong truong trinh xe xuat write byte ra mang hinh
; Luc dau chua dua gia tri vao nen mac dinh la 000
; Thay doi gia tri write byte = 'a' khi nhan 'N' thi se in ra 'a' tai vi tri Gia tri nhap:
; Nhap 'X' Con tro se chuyen xuong vi tri Gia tri xuat:
; khi ta nhap so thap phan 3 chu so 'b' thi b se duoc read ra Read byte.