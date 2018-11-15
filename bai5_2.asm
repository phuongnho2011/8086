.model small
.stack 100h
.data
pa DB 00h, 00h, 00h, 00h, 00h
DB 7Eh, 09h, 09h, 09h, 7Eh, 00h
DB 7Fh, 49h, 49h, 49h, 36h, 00h
DB 00h, 00h, 00h
pb DB 01h,02h,04h,08h,10h
.code
main proc
mov ax,@data
mov ds,ax
mov ax,02h
int 10h
mov dx,303h
mov al,80h
out dx,al ; Dinh cau hinh cho U9
start: mov ah,0Bh ; Kiem tra phim nhan
int 21h
cmp al,0FFh ; Neu co nhan phim thi ket thuc
je exit ; chuong trinh
mov si,0 ; Lan quet 0
quetled:
mov cx,3 ;
led:
call ledmatrix
loop led
inc si
cmp si,16 ; Quet 16 lan, tu lan 0 -> 15
jne quetled
jmp start
exit: mov ah,4Ch
int 21h
main endp
;--------------------------------------------
ledmatrix proc
mov bx,0 ; Lap 5 lan cho 5 cot
cont: mov dx,300h
mov al,pa[bx+si] ; Xuat du lieu ra Port A (hien
; thi cot cho ma tran Led)
out dx,al
mov dx,301h
mov al,pb[bx] ; Chon cot cho ma tran Led
out dx,al
call delay
inc bx
cmp bx,5
jne cont
ret
ledmatrix endp
;--------------------------------------------
delay proc
push cx
mov cx,03Fh
loop $
pop cx
ret
delay endp
end main