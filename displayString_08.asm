;PROGRAM TO PRINT STRING
;DISPLAYING STRING CHARACTER BY CHARACTER USING LOOP
;using DOS Interrupt Service 2 for display string

STSEG SEGMENT
    DB 32 DUP(?)
STSEG ENDS

DTSEG SEGMENT
     
    STR1 DB "Nabeel @ Code"      ; NO NEED OF $ BECAUSE WE ARE DISPLAYING STRING USING LOOP CHARACTER BY CHARACTER   
    LEN DW 13       ;length of str1

DTSEG ENDS

CDSEG SEGMENT
    MAIN PROC
        
        ASSUME SS: STSEG, DS:DTSEG, CS:CDSEG
    
        MOV AX, DTSEG
        MOV DS, AX

        ;-------------------------------------------

        MOV BX, OFFSET STR1     ;TAKE BASE LOCATION OF ARRAY IN BX
        
        MOV CX, LEN           ;MOV LENGTH OF STR1 IN CX
        
        AGAIN:
            MOV DL, [BX]        ;GET FIRST CHARACTER INTO DL
            MOV AH, 2           ;DISPLAY CHARACTER     
            INT 21H            
            
            INC BX              ;INCREMENT BX TO GET THE LOCATION OF NEXT CHARACTER        
            LOOP AGAIN
        
        ;-------------------------------------------    
    
        MOV AH, 4CH
        INT 21H

    MAIN ENDP
CDSEG ENDS
END MAIN
