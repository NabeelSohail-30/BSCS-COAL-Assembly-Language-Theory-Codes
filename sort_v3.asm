.model small  
.stack 32h
.data
arr db 14h, 8h, 7h
.code
main proc
    mov ax, @data
    mov ds, ax
;size of array: n=3 
;ptr si will be used 3-1 = 2 times
;ptr1 di will be used 3-1 = 2 times in first iteration of si 
;and ptr1 di will be used 3-2 = 1 time in second iteration of si               
    
    mov si, offset arr
   
    mov di, si                      ;initialize di for si=0, di=0
    
    mov al, [si]
    
    inc di                          ;inc di repeat 1, si=0, di=si+1
    cmp al, [di]
    jae sub_swap
    jb  donot_swap
   
 sub_swap:  call swap
             
   donot_swap:
    inc di                          ;inc di repeat 2, si=0, di=si+2
    cmp al,[di]
    jae sub_swap1
    jb  donot_swap1
   
 sub_swap1: call swap
   
   donot_swap1:
    inc si                          ;inc si, si=1      
    
    mov di, si                      ;initializing di for si=1, di=1
        
    mov al, [si]
    
    inc di                          ;inc di repeat 1, si=1, di=si+1
    cmp al, [di]
    jae sub_swap2
    jb  donot_swap2  
    
   sub_swap2: call swap
   
   
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
