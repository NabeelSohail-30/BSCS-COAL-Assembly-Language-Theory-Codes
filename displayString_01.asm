;PROGRAM TO PRINT STRING
;character by character
;using DOS Interrupt Service 2
STSEG SEGMENT
    DB 32 DUP(?)
STSEG ENDS

DTSEG SEGMENT

DTSEG ENDS

CDSEG SEGMENT
    MAIN PROC
        
        ASSUME SS: STSEG, DS:DTSEG, CS:CDSEG
    
        MOV AX, DTSEG
        MOV DS, AX


        MOV DL, 'H'             ;displaying character
        MOV AH, 2
        INT 21H   
            
        MOV DL, 'E'             ;displaying character            
        MOV AH, 2
        INT 21H  
            
        MOV DL, 'L'             ;displaying character
        MOV AH, 2
        INT 21H 
            
        MOV DL, 'L'             ;displaying character
        MOV AH, 2
        INT 21H                                        
            
        MOV DL, 'O'             ;displaying character
        MOV AH, 2
        INT 21H                                        
            
        MOV DL, 'W'             ;displaying character
        MOV AH, 2
        INT 21H        

        MOV DL, 'O'             ;displaying character
        MOV AH, 2
        INT 21H

        MOV DL, 'R'             ;displaying character
        MOV AH, 2
        INT 21H

        MOV DL, 'L'             ;displaying character
        MOV AH, 2
        INT 21H

        MOV DL, 'D'             ;displaying character
        MOV AH, 2
        INT 21H
        
        MOV AH, 4CH             ;end/terminate program, send control to OS 
        INT 21H

    MAIN ENDP
CDSEG ENDS
END MAIN
