;PROGRAM TO PRINT STRING
;as a whole string defined in data segment
;using DOS Interrupt Service 9

STSEG SEGMENT
    DB 32 DUP(?)
STSEG ENDS

DTSEG SEGMENT
     
     STR1 DB "Hello World$"      ; $ IS USED AS END OF LINE MARKER

DTSEG ENDS

CDSEG SEGMENT
    MAIN PROC
        
        ASSUME SS: STSEG, DS:DTSEG, CS:CDSEG
    
        MOV AX, DTSEG
        MOV DS, AX

        MOV DX, OFFSET STR1     ;display complete string
        ;LEA DX, STR1           ;alternate way, display complete string
        MOV AH, 9
        INT 21H        
    
        MOV AH, 4CH             ;EXIT TO DOS
        INT 21H

MAIN ENDP
CDSEG ENDS
END MAIN
