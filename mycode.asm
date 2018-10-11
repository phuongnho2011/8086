.model small
.stack 100h
.data

.code 

main proc
    int 10h
    mov al,15h
    mov ah,41h
    mul ah
    mov ah, 02h 
    mov ah,4Ch
    int 21h
main endp
    
    