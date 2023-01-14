newline macro
    mov ah, 02h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
endm

.model small
.stack 100h
.data
    m db 0h
    q db 0h
    a db 00h  
    cnic db 14 dup('$')
.code
main proc
    ;initialize data segment
    mov ax, @data
    mov ds, ax
     
    ;get cnic from user
    mov cx, 13
    mov ah, 1
    mov si, offset cnic
    get:
    int 21h  
    mov [si], al
    inc si
    loop get
    
    ;get last 2 numbers of cnic
    lea si, cnic
    mov al, [si+11]     ;2nd last num
    and al, 0fh  
    mov q, al
    
    mov al, [si+12]     ;last num
    and al, 0fh
    mov m, al                    

    mov al, m   ; Load the multiplicand into AX   ---- M
    mov bl, q     ; Load the multiplier into BX   ---- Q
    mov cx, 8          ; Load the count into CX
    mov dx, 0      ;result                        ----- A

    loop:
        shr bx, 1              ; Shift the multiplier right by 1 bit
        jnc skip               ; If the LSB is 0, skip the add
        add dx, ax   ; Otherwise, add the multiplicand to the result
        jmp shift
    
    skip:
        shl dx, 1              ; Shift the result left by 1 bit
        shl ax, 1    ; Shift the multiplicand left by 1 bit
    
    shift:
        loop loop              ; Decrement the count and go back to the beginning
                               ; of the loop if it is not zero
                               
    mov bx, ax
         
    
    ;;display result
;    mov bx,dx
;    mov ah, 2
;    mov dl, bh
;    int 21h
;    mov dl, bl
;    int 21h

    exit:
    mov ah, 4ch
    int 21h
        
main endp