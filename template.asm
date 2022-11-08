;Segment defined as stack segment and named as "STSEG"
;It can be named with programmer's choice but must not be a keyword
STSEG SEGMENT		

	DB 64 DUP(?)	;defining an array of 64bytes, DB (Defining Byte) and DUP (Duplicate)

STSEG ENDS		;stack segment ends here, ENDS (End Segment)

;Segment defined as data segment and named as "DTSEG"
;It can be named with programmer's choice but must not be a keyword
DTSEG SEGMENT


DTSEG ENDS		;data segment ends here, ENDS (End Segment)

;Segment defined as code segment and named as "CDSEG"
;It can be named with programmer's choice but must not be a keyword
CDSEG SEGMENT

    MAIN PROC		;main procedure starts here (similar to void main (void))
    
        ;informing the code about assumptions that STSEG is SS, DTSEG is DS, and CDSEG is CS
        ASSUME SS:STSEG, DS:DTSEG, CS:CDSEG
        
        MOV AX, DTSEG		;initializing the data segment by moving the value of DTSEG in DS
        MOV DS, AX
        
        ;write your code here
        
        
        
        ;transferring the control to the operating system by using interrupt 21h
        MOV AH, 4CH		;AH = 4C (hexadecimal)
        INT 21H
    
    MAIN ENDP		;main procedures ends here, ENDP (End Procedure)

CDSEG ENDS		;code segment ends here, ENDS (End Segment)

END MAIN		;the whole code (program) ends here