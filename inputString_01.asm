;program to take string input from user
;using buffered input, dos service 0ah
;and display it on the screen
;using dos service 09h
;also replaces the . at the end of the string by $
.model small
.stack 64h
.data
    msg db "Enter Your First Name: $"
    msg2 db "Enter Your Last Name: $"
    firstName db 32, ?, 32 dup('$')
    lastName db 32, ?, 32 dup('$')
    msg3 db "Your Full Name is $"
    NEWLINE db 0dh, 0ah, '$'
.code
    start:
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, msg
        int 21h

        mov ah, 0Ah
        lea dx, firstName
        int 21h

        mov ah, 09h
        lea dx, NEWLINE
        int 21h

        mov ah, 09h
        lea dx, msg2
        int 21h

        mov ah, 0Ah
        lea dx, lastName
        int 21h

        mov ah, 09h
        lea dx, NEWLINE
        int 21h
        mov ah, 09h
        lea dx, NEWLINE
        int 21h

        mov ah, 09h
        lea dx, msg3
        int 21h

        mov bx, offset firstName
        mov cx, 0
        mov cl, [bx+1]
        mov si, offset firstName
        add cl, 2
        add si, cx
        mov [si], '$'

        mov ah, 09h
        lea dx, firstName+2
        int 21h

        mov dl, ' '
        mov ah, 02h
        int 21h

        mov bx, offset lastName
        mov cx, 0
        mov cl, [bx+1]
        mov si, offset lastName
        add cl, 2
        add si, cx
        mov [si], '$'

        mov ah, 09h
        lea dx, lastName+2
        int 21h
        
        mov ax, 4c00h
        int 21h
end start
