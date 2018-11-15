.model small
.stack 100h
.data
.code
main proc
     mov ax,data
     mov ds,ax
     mov ax,02h
     int 10h
     mov dh,1
     mov dl,15
     
lap: 
     
     mov ah,02h
     int 10h
     
     push dx
     mov dl,'A'
     mov ah,02h
     int 21h
     pop dx
     
     call delay
           
     ;mov ah,02h
     ;int 10h
     ;push dx
     ;mov dl,' '
     ;mov ah,02h
     ;int 21h
     ;pop dx
     
     inc dh
     dec dl
     cmp dl,0
     jne lap
     
exit:
     mov ah,4Ch
     int 21h
     
main endp
delay proc
    
     push cx
     mov cx,0fh
     loop $
     pop cx
     ret  
     
delay endp
end main 

; se khong co khoang trang hien ra do khong co doan code
; xuat khoang trang