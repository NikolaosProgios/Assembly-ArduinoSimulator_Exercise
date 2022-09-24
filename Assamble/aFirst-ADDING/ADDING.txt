TITLE SIMPLE_ADD 
KODIKAS SEGMENT ; STANDAR
    ASSUME CS:KODIKAS, DS:DEDOMENA ; STANDAR
    ARXI:   ; STANDAR
        MOV AX,DEDOMENA	;STANDAR
	    MOV DS,AX	 ;STANDAR

        LEA DX,MINIMA ; DX=MINIMA ; STANDAR
        MOV AH,9; ax = 9   ; STANDAR
        INT 21H  ; STANDAR
		; EMFANIZEI TO DX(=MINIMA)
        
		MOV AL,N1 ; al=3 ; N1 DB 3 
        ADD AL,N2 ; all =all + 5   ; N2 DB 5
        ;sxolio
        
		MOV DL,AL ; DL=AL=8
        ADD DL,48 ; STANDAR 48 GIA ascii timi 
        MOV AH,2 ; AH=2 ; STANDAR
        INT 21H ; STANDAR
    
        MOV AH,4CH ; STANDAR 
        INT 21H ; STANDAR
	
KODIKAS ENDS

DEDOMENA SEGMENT  
    N1 DB 3
    N2 DB 5                      
    ; 10 se ascii = newline  (kato apo to telous toy pano)
    ; 13 se ascii cret(enter)              
    ; 7 se ascii einai to sound beep , messege false
    MINIMA DB "TO ATHISMA EINAI:",10,13," $"
DEDOMENA ENDS


    END ARXI 