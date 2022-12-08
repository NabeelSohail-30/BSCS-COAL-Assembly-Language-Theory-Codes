.model small  
.stack 32h
.data
arr db 14h, 8h, 7h, 12h, 21h, 45h, 14h
.code
main proc
    mov ax, @data
    mov ds, ax               
    
    mov si, offset arr
    
    mov cx, 6   
outer:
    mov di, si                      ;initialize di for si=0, di=0
    
    
    push cx
inner: 
    mov al, [si]
    inc di                          ;inc di repeat 1, si=0, di=si+1
    cmp al, [di]
    jbe  donot_swap
    
    call swap
        
donot_swap:
    loop inner
   
    pop cx
    inc si                          ;inc si, si=1      
    loop outer
    
   
   
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
