TITLE WELCOME
KODIKAS SEGMENT
    ASSUME CS:KODIKAS, DS:DEDOMENA
    ARXI:   
        MOV AX,DEDOMENA	
	    MOV DS,AX	

        LEA DX,MINIMA
        MOV AH,9
        INT 21H
        
    
        MOV AH,4CH
        INT 21H
	
KODIKAS ENDS

DEDOMENA SEGMENT  

    MINIMA DB "WELCOME TO ASSEMBLY 8086 $"
DEDOMENA ENDS


    END ARXI 