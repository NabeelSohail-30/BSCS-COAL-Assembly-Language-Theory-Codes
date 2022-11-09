;PROGRAM TO PRINT STRING
;multiple strings in multiple line, each in new line
;using DOS Interrupt Service 9 for string display
;using DOS Interrupt Service 2 for line feed and carriage return

STSEG SEGMENT
    DB 32 DUP(?)
STSEG ENDS

DTSEG SEGMENT
     
    STR1 DB "Hello World$"      ; $ IS USED AS END OF LINE MARKER   
    STR2 DB "Code in Assembly Language$"         
    STR3 DB "This is a test program$"
    STR4 DB "By Nabeel Sohail - 211$"
    
DTSEG ENDS

CDSEG SEGMENT
    MAIN PROC
        
        ASSUME SS: STSEG, DS:DTSEG, CS:CDSEG
    
        MOV AX, DTSEG
        MOV DS, AX

        MOV DX, OFFSET STR1     ;display str1
        MOV AH, 9
        INT 21H      
        
        ;--------------------------------------------       

        MOV DL, 0AH             ;CHARACTER FOR LINE FEED
        MOV AH, 2       
        INT 21H       
                       
        MOV DL, 0DH             ;character for carriage return
        MOV AH, 2
        INT 21H
        
        ;--------------------------------------------        
                                                 
        MOV DX, OFFSET STR2     ;display str2
        MOV AH, 9
        INT 21H  
        
        ;--------------------------------------------       

        MOV DL, 0AH             ;CHARACTER FOR LINE FEED
        MOV AH, 2       
        INT 21H       
                       
        MOV DL, 0DH             ;character for carriage return
        MOV AH, 2
        INT 21H
        
        ;--------------------------------------------        
                                                 
        MOV DX, OFFSET STR3     ;display str3
        MOV AH, 9
        INT 21H  
        
        ;--------------------------------------------       

        MOV DL, 0AH             ;CHARACTER FOR LINE FEED
        MOV AH, 2       
        INT 21H       
                       
        MOV DL, 0DH             ;character for carriage return
        MOV AH, 2
        INT 21H
        
        ;--------------------------------------------        
                                                 
        MOV DX, OFFSET STR4     ;display str4
        MOV AH, 9
        INT 21H
        
        ;--------------------------------------------  

        MOV AH, 4CH             ;terminate program
        INT 21H

    MAIN ENDP
CDSEG ENDS
END MAIN
