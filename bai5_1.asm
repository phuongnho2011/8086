#start=ledmatrix.exe#
.model small
.stack 100h
.data  
;Chu A
pa db 7Eh,09h,09h,09h,7Eh 
;Chu B
pb db 7Fh,49h,49h,49h,36h
;Chu C
pc db 3Eh,41h,41h,41h,22h 
;so 0
p0 db 3Eh,41h,41h,41h,3Eh
;so 1
p1 db 04h,02h,7Fh,0h,0h

px db 01h,02h,04h,08h,10h
.code
main proc
mov ax,@data
mov ds,ax
mov ax,02h
int 10h
mov dx,303h
mov al,80h
out dx,al           ; Dinh cau hinh cho U9
start: mov ah,0Bh   ; Kiem tra phim nhan
int 21h
cmp al,0FFh         ; Neu co nhan phim thi ket thuc
je exit             ; chuong trinh
mov cx,3      
chuA:
call ledmatrixchuA
loop chuA 
mov cx,3 
chuB:
call ledmatrixchuB
loop chuB 
mov cx,3
chuC: 
call ledmatrixchuC 
loop chuC
mov cx,3
so0:
call ledmatrixso0  
loop so0
mov cx,3
so1:
call ledmatrixso1   
loop so1
jmp start
exit: mov ah,4Ch
int 21h
main endp
;--------------------------------------------
ledmatrixchuA proc
mov bx,0            ; Lap 5 lan cho 5 cot
cont: mov dx,300h
mov al,pa[bx]       ; Xuat du lieu ra Port A (hien
                    ; thi cot cho ma tran Led)
out dx,al
mov dx,301h
mov al,px[bx]       ; Chon cot cho ma tran Led
out dx,al
call delay
inc bx
cmp bx,5
jne cont
ret
ledmatrixchuA endp
;--------------------------------------------

;--------------------------------------------
ledmatrixchuB proc
mov bx,0            ; Lap 5 lan cho 5 cot
cont1: mov dx,300h
mov al,pb[bx]       ; Xuat du lieu ra Port A (hien
                    ; thi cot cho ma tran Led)
out dx,al
mov dx,301h
mov al,px[bx]       ; Chon cot cho ma tran Led
out dx,al
call delay
inc bx
cmp bx,5
jne cont1
ret
ledmatrixchuB endp
;--------------------------------------------  

;--------------------------------------------
ledmatrixchuC proc
mov bx,0            ; Lap 5 lan cho 5 cot
cont2: mov dx,300h
mov al,pc[bx]       ; Xuat du lieu ra Port A (hien
                    ; thi cot cho ma tran Led)
out dx,al
mov dx,301h
mov al,px[bx]       ; Chon cot cho ma tran Led
out dx,al
call delay
inc bx
cmp bx,5
jne cont2
ret
ledmatrixchuC endp
;-------------------------------------------- 

;--------------------------------------------
ledmatrixso0 proc
mov bx,0            ; Lap 5 lan cho 5 cot
cont3: mov dx,300h
mov al,p0[bx]       ; Xuat du lieu ra Port A (hien
                    ; thi cot cho ma tran Led)
out dx,al
mov dx,301h
mov al,px[bx]       ; Chon cot cho ma tran Led
out dx,al
call delay
inc bx
cmp bx,5
jne cont3
ret
ledmatrixso0 endp
;--------------------------------------------  

;--------------------------------------------
ledmatrixso1 proc
mov bx,0            ; Lap 5 lan cho 5 cot
cont4: mov dx,300h
mov al,p1[bx]       ; Xuat du lieu ra Port A (hien
                    ; thi cot cho ma tran Led)
out dx,al
mov dx,301h
mov al,px[bx]       ; Chon cot cho ma tran Led
out dx,al
call delay
inc bx
cmp bx,5
jne cont4
ret
ledmatrixso1 endp
;--------------------------------------------

delay proc
push cx
mov cx,03Fh
loop $
pop cx
ret
delay endp
end main