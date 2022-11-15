;Program to Display String
;using Sub Routine (Function)

.model small
.stack 100h
.data
    msg db "Code by Nabeel",0dh,0ah,"$" ;str
.code
    main proc
        mov ax,@data
        mov ds,ax

        call displayStr
        
        mov ah,4ch
        int 21h
    main endp

    displayStr proc
        push ax
        push dx

        mov ah,09h
        lea dx,msg
        int 21h
        
        pop dx
        pop ax
        ret
    displayStr endp

end main