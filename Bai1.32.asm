.model small
.stack 100h
.data
.code
main proc
     mov ax,data
     mov ds,ax
     mov ax,02h
     int 10h 
     
begin:    

     mov dh,1
     mov dl,1
     
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
   
     inc dl
     cmp dl,11
     jne lap 
     
lap1:

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
     cmp dl,1
     jne lap1
     
lap2:

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
     cmp dh,21
     jne lap2 
     
lap3:
     
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
   
     dec dh
     inc dl
     cmp dh,11
     jne lap3
     
lap4:

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
   
     dec dh
     dec dl
     cmp dh,1
     jne lap4
     
     jmp begin
          
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