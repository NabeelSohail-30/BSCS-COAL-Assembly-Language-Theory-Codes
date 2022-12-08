.model small  
.stack 32h
.data
arr db 14h, 8h, 7h
.code
main proc
    mov ax, @data
    mov ds, ax
               
    
    mov si, offset arr
   
    mov di, si
   
    inc di
   
    mov al, [si]
    cmp al, [di]
    jae swap
    jb  donot_swap
   
   swap:
    mov dl, [si]
    mov dh, [di]
    mov [si],dh
    mov [di],dl
   
   donot_swap:
    inc di
    cmp al,[di]
    jae swap1
    jb  donot_swap1
   
   swap1:
    mov dl, [si]
    mov dh, [di]
    mov [si],dh
    mov [di],dl
   donot_swap1:
    inc si
    mov di, si
    inc di
    
    mov al, [si]
    cmp al, [di]
    jae swap2
    jb  donot_swap2  
    
   swap2:
    mov dl, [si]
    mov dh, [di]
    mov [si],dh
    mov [di],dl
   donot_swap2:
    mov ah, 4ch
    int 21h
main endp
end main
