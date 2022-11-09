;PROGRAM TO PRINT STRING
;multiple strings
;using DOS Interrupt Service 9

STSEG SEGMENT
    DB 32 DUP(?)
STSEG ENDS

DTSEG SEGMENT
     
     STR1 DB "Hello World$"      ; $ IS USED AS END OF LINE MARKER   
     STR2 DB "Coded in Assembly Language$"       

DTSEG ENDS

CDSEG SEGMENT
    MAIN PROC
        
        ASSUME SS: STSEG, DS:DTSEG, CS:CDSEG
    
        MOV AX, DTSEG
        MOV DS, AX

        MOV DX, OFFSET STR1     ;print str1
        MOV AH, 9
        INT 21H      
                  
        MOV DX, OFFSET STR2     ;print str2, without space between str1 and str2
        MOV AH, 9
        INT 21H  

        MOV AH, 4CH
        INT 21H

    MAIN ENDP
CDSEG ENDS
END MAIN
