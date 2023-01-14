.model small
.stack 100h
; Set up the data segment
.data
     promptNum1 db "Enter Single Digit Number 01: $"
     promptNum2 db "Enter Single Digit Number 02: $"
     promptOp db "Enter Operator: $"
     errorMsg db "Invalid Operator $"
     
.code
    main proc
               
    mov ax, @data
    mov ds, ax
    
    ; Display the prompt and read the first number
    mov ah, 09h
    mov dx, offset promptNum1
    int 21h
    
    mov ah, 01
    int 21h
    mov bl, al
    
    call newLine  

    ; Display the prompt and read the second number
    mov ah, 9h
    mov dx, offset promptNum2
    int 21h
    
    mov ah, 1
    int 21h
    mov bh, al   
    
    call newLine

    ; Display the prompt and read the operator
    mov ah, 9h
    mov dx, offset promptOp
    int 21h
    
    mov ah, 1
    int 21h
    
    call newLine          
    
    cmp al, '+'
    je add
    cmp al, '-'
    je sub
    cmp al, '*'
    je mul
    cmp al, '/'
    je div
    jmp error
    
    call newLine

; Add the two numbers and display the result
add:
    mov al, bl
    add al, bh
    aaa
    or ax, 3030h
    mov ah, 2
    mov dl, al
    int 21h
    jmp exit

; Subtract the two numbers and display the result
sub:
    mov al, bl
    sub al, bh
    aas
    or ax, 3030h
    mov ah, 2
    mov dl, al
    int 21h
    jmp exit

; Multiply the two numbers and display the result
mul:
    mov al, bl
    and al, 0fh
    and bh, 0fh
    mul bh
    aam
    or ax, 3030h
    mov cx, ax
    mov ah, 2
    mov dl, ch
    int 21h
    mov dl, cl
    int 21h
    jmp exit

; Divide the two numbers and display the result
div:
    mov al, bl
    and al, 0fh
    and bh, 0fh
    aad
    div bh
    or ax, 3030h
    mov ah, 2
    mov dl, al
    int 21h
    jmp exit

; Display an error message
error:         
    call newLine
    mov ah, 9h
    mov dx, offset errorMsg
    int 21h

; Exit the program
exit:
    mov ah, 04ch
    int 021h

main endp

newLine proc
    push ax
    push dx
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    pop dx
    pop ax
    
    ret
newLine endp

end main 