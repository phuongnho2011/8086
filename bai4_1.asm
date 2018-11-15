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
mov al,90h      ; Dinh cau hinh cho 8255
mov dx,303h     ; PA: nhap, PB: xuat
out dx,al
begin:
mov ah,0Bh      ; Kiem tra phim nhan
int 21h
cmp al,0FFh     ; Neu co nhan phim thi ket thuc chuong trinh
je exit  
mov dx,300h     ; Dia chi Port A
in al,dx
mov dx,0116h    ; Chuyen toa do den
mov ah,02h      ; hang 1, cot 22
mov bh,0
int 10h
call Xuatthapphan
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
END main