.model small
.stack 100h
.data
pa db 80h,20h,40h,10h,08h,04h,02h,01h
.code
main proc
mov ax,@data
mov ds,ax
mov ax,02h
int 10h
mov al,82h ;PA: XUAT, PB: NHAP, PC: XUAT
mov dx,303h ;Dia chi CR cia 8255
out dx,al ;Dinh cau hinh cho 8255
mov bx,0
mov dx,300h ; Dia chi Led
next1:
mov al,pa[bx]
out dx,al
call delay
inc bx
cmp bx,8 ; Led co 8 trang thai
jne next1
exit:
mov ah,4Ch ; Ket thuc chuong trinh
int 21h
main ENDP
;---------------------------------------------
delay proc
push cx
mov cx,0Fh
loop $
pop cx
ret
delay endp
END main 
;Code cua file pdf bi sai (led 2 3 4 nhay sai)
;code cua em dung dich bit 
;#start=8255.exe#
;.model small
;.stack 100h
;.data
;.code
;main proc
;mov ax,@data
;mov ds,ax
;mov ax,02h
;int 10h
;mov al,82h
;mov dx,303h
;out dx,al  
;mov cx,8 ;  Gan CX = 8  
;mov al,80h
;mov dx,300h  
;lap:
;out dx,al
;shr al,1
;call delay  
;loop lap ; So lan lap tuy theo CX
;exit:
;mov ah,4Ch
;int 21h
;main endp
;delay proc
;push cx
;mov cx,0Fh
;loop $
;pop cx
;ret
;delay endp
;end main 