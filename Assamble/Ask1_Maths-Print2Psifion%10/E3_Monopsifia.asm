; STANDAR
TITLE SIMPLE_ADD
KODIKAS SEGMENT
    ASSUME CS:KODIKAS, DS:DEDOMENA
    ARXI: 
        MOV AX , DEDOMENA
        MOV DS , AX

        LEA DX,MINIMA         
        MOV AH,9
        INT 21H 
; PANTA AX , AH, DS ,DX ,CS 
; /STANDAR            
     
		;BH =N1 * N1
		MOV AL , N1 ; AL=N1=3
		MUL AL ; AL = AL*AL (3*3)
		MOV BH , AL ; BH =AL =9
		; DH =2*N1		
		MOV DH , 2 ; DH=2
        MOV AL , N1 ; AL=N1=3
        MUL DH ; DH=AL*DH(3*2)
		MOV DH , AL
		; BH - DH 
		SUB BH , DH 
		; BH+1
		INC BH 
		MOV AL , BH
	        
; STANDAR
		MOV DL,AL ; DL=AL=8
        ADD DL,48 ; STANDAR
        MOV AH,2 ; AH=2 ; STANDAR
        INT 21H ; STANDAR
    
        MOV AH,09h ; STANDAR 
        INT 21H ; STANDAR
; /STANDAR
KODIKAS ENDS

DEDOMENA SEGMENT  
    N1 DB 3 
    MINIMA DB "TO APOTELESMA EINAI: $"
DEDOMENA ENDS
    END ARXI 