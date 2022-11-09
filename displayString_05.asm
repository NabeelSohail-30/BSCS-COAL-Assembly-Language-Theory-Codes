;PROGRAM TO PRINT STRING
;display 2 strings each on new screen
;using DOS Interrupt Service 2 for display string
;and BIOS Interrupt Services to Clear Screen, Set Default Screen Attributes

STSEG SEGMENT
    DB 32 DUP(?)
STSEG ENDS

DTSEG SEGMENT
     
     STR1 DB "Hello World$"      ; $ IS USED AS END OF LINE MARKER   
     STR2 DB "Lets Code Assembly$"         
    
DTSEG ENDS

CDSEG SEGMENT
    MAIN PROC
        
        ASSUME SS: STSEG, DS:DTSEG, CS:CDSEG
    
        MOV AX, DTSEG
        MOV DS, AX

        ;-------------------------------------------
        MOV DX, OFFSET STR1         ;display str1
        MOV AH, 9
        INT 21H            
        
        ;-------------------------------------------    
        
        ;CLEAR SCREEN 
        MOV AH, 6                   ;SCROLL UP THE SCREEN

        ;SCREEN DIMENSION (TOP LEFT COORDINATES IN CX AND BOTTOM RIGHT COORDINATES IN DX
        MOV CH, 0                   ;ROW OF TOP LEFT COORDINATES        
        MOV CL, 0                   ;COLUMN OF TOP LEFT COORDINATES
        
        MOV DH, 23                  ;ROW OF BOTTOM RIGHT COORDINATES
        MOV DL, 79                  ;COLUMN OF BOTTOM RIGHT COORDINATES
        
        ;NORMAL SCREEN ATTRIBUTE (FOREGROUND WHITE AND BACKGROUND BLACK)
        MOV BH, 7           
                       
        INT 10H                     ;BIOS Interrupt
                                           
        ;-------------------------------------------        

        MOV DX, OFFSET STR2         ;display str2
        MOV AH, 9
        INT 21H                              
        
        ;-------------------------------------------

        MOV AH, 4CH                 ;EXIT TO DOS
        INT 21H

    MAIN ENDP
CDSEG ENDS
END MAIN