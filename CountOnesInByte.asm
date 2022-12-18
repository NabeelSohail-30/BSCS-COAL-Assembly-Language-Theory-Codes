.model small
.stack 100h
.data
    msg db "Enter a single digit Number: $"
    msg2 db "Number of ones: $"
    newLine db 0dh, 0ah, '$'
.code
start:
    mov ax,@data
    mov ds,ax

    mov ah, 9
    mov dx, offset msg
    int 21h

    mov ah, 01h
    int 21h
    mov dh,al
    

    # Count the number of ones in the byte
    mov bl, 0            ; counter for number of ones
    mov cx, 4            ; loop counter (8 iterations to check all bits)
loop:
    shr dh, 1
    jc increment
    jmp endLoop
increment:
    inc bl
endLoop:
    loop loop

    MOV AL,BL               ;MOV BL CONTENT TO AL
    MOV DL,01               ;MOV DL TO 01
    MUL DL                  ;MULTIPLY DL AND AL 
    AAM                     ;ASCII ADJUST FOR MULTIPLICATION
    OR AX,3030H             ;AX=3030H
    MOV BX,AX               ;MOV AX CONTENT TO BX

    mov ah, 9
    mov dx, offset newLine
    int 21h

    mov ah, 9
    mov dx, offset msg2
    int 21h

    mov ah, 02h
    mov dl, bh
    int 21h
    mov dl, bl
    int 21h
    
    mov ah,4ch
    int 21h
end start