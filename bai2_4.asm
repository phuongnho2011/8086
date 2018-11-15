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
mov al,82h  ;PA: XUAT, PB: NHAP, PC: XUAT
mov dx,303h ;Dia chi CR cua 8255
out dx,al   ;Dinh cau hinh cho 8255
mov dx,300h ;Dia chi Port A (noi voi Led)
mov al,03Ch
out dx,al
exit:
mov ah,4Ch  ;Ket thuc chuong trinh
int 21h
main endp
END main