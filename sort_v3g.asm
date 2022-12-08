.model small  
.stack 32h
.data
arr db 14h, 8h, 7h, 12h, 21h, 45h
.code
main proc
    mov ax, @data
    mov ds, ax               
    
    mov si, offset arr
    
    mov cx, 5   
outer:
    mov di, si                      ;initialize di for si=0, di=0
    
    
    mov bx, cx
inner: 
    mov al, [si]
    inc di                          ;inc di repeat 1, si=0, di=si+1
    cmp al, [di]
    jb  donot_swap
    
    call swap
        
donot_swap:
    dec bx
    cmp bx, 0
    jnz inner
   
    inc si                          ;inc si, si=1      
    dec cx
    cmp cx, 0
    jnz outer
    
   
   
   donot_swap2:
    mov ah, 4ch
    int 21h
main endp

swap proc
    mov dl, [si]
    mov dh, [di]
    mov [si],dh
    mov [di],dl
    ret
swap endp

end main
