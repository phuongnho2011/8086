#start=simple.exe#
.model small
.stack 100h
.data

.code
  
main proc 
    
    mov dx, 110 
    IN  ax, dx 
      
    mov dx, 112
    OUT dx, ax 
    
    mov ah, 4Ch
    int 21h
        
main endp  
        
        