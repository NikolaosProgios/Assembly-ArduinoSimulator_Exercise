;Progios Nikolaos ; 175002
.MODEL SMALL
.STACK 100H
.CODE
TITLE Exams_175002
KODIKAS SEGMENT PUBLIC
ASSUME CS:KODIKAS, DS:DEDOMENA,
    KYRIO PROC NEAR
                    ; OI 2 PARAKATO ENTOLES APOKATHISTOYN THN TIMH TOY DS.
	    MOV AX,DEDOMENA 
	    MOV DS,AX      
 B2: 
  	    LEA DX,MESSAGE  ; BAZOYME TH DIEYTHINSI MNIMIS TOY MESSAGE STON DX
	    MOV AH,09H	    ; METAFEROYME STON AH TO 9 GIA NA MPOROYME NA EMFANISOYME TO MESSAGE
	    INT 21H	        ; KALOYME TO LEITOYRGIKO SYSTIMA NA EMFANISEI STIN OTHONI TO MESSAGE         
   	
        MOV AH,08H  ; Eisagoume xarakthra apo to plhktrologio XORIS parallhlh emfanish
	    INT 21H		; H ASCII timh tou xarakthra apothikeuetai ston AL

	    CMP AL,'A'	; Sygkrinoume auto pou patithike me tin ASCII timi tou A
	    JB minima		; An einai mikroteri i ASCII timi tou pane sto "MINIMA" gia EMFANSI minimatos

	    CMP AL,'Z'	; Sygkrinoume auto pou patithike me tin ASCII timi tou Z 
	    JA minima		; An einai megaliteri i ASCII timi tou pane sto "MINIMA" gia EMFANSI minimatos
       
        MOV DL , AL ; dl pernei to kefaleo gramma apo AL gia na emfanistei
        MOV AH , 2  ; Metaferoyme ston AH to 2 gia na mporoyme na emfanisoyme to periexomeno toy DL
        INT 21H		; Kaloyme to leitoyrgiko systima na emfanisei stin othoni tin ASCII timi poy exei o DL
        jmp next
minima:
        Lea dx, wrong ; BAZOYME TH DIEYTHINSI MNIMIS TOY wrong STON DX
        mov ah , 09h
        int 21h
        MOV AH,2
        MOV DL, 07H    ; BEEP
        INT 21H 
        jmp  B2        ; pigene sto b2, gia tin sinexisi eigagogis grammatos 
next:    
        CALL YPO1   ; KALOYME TIN YPOROUTINA YPO1
        
        MOV AH,4CH	; Eksodos sto leitoyrgiko systhma
	    INT 21H           
    	
KYRIO ENDP 
    
YPO1 PROC NEAR
    
    mov BL , DL ; PERNAO to gramma se katoxoriti sto ypoprogramma 
         ; to bl exei to gramma
    mov AL , BL ; PERNO to gramma apo to bl kai sto all
    mov ah , 0
    mul aL  ; to ypsono sto tetragono , diladi
           ; to polaplasiazo me tonn eafto toy mia fora    
               
    mov dl , 32 ; bazo sto dl tin timi 32 gia na diareso
    div dl      ; diairo to AL(gramma) me to dl(32)
        
    mov dl , al
    MOV DL, AL	; Metaferoume to athroisma apo ton AL ston DL gia na ginei to perasma meso kataxoriti
	CALL DISPLAY_HEX; Kaloume tin Display_hex 

	 RET		; Epistrefo stin thesi apo opou klithike h yporoutina
	 
YPO1 ENDP
 
;Hexadecimal
DISPLAY_HEX PROC NEAR
	
	
	MOV BL,DL	; Metafero to periexomeno tou DL se allo kataxoriti giati ton xriazomai kai pali
    
    LEA DX , FINALMES   ; EMFANIZOYMETO MINIMA
	MOV AH , 09H
	INT 21H
	                    ; KAI KSENIMAE TIN METATROPI
	MOV BH,0	; Mizenizo ton BH kai etsi ksero oti o BX exei ayto pou eixe o BL
	MOV CL,4	; Bazo ston CL 4 gia na exo toses epanalipseis

	SHL BX,CL	; Metatopizo aristera ton BX tosa bit osa exei o CL
	MOV DL,BH	; Metaferoume ton proto hex arithmo apo ton BH ston DL gia na ginei to perasma 

	CALL ONE_DIGIT	; Kaloume tin One_digit 

	MOV CL,4	; Bazo ston CL 4 gia na exo toses epanalipseis

	SHR BL,CL	; Metatopizo Deksia ton BL tosa bit osa exei o CL
	MOV DL,BL	; Metaferoume ton deftero hex arithmo apo ton BL ston DL gia na ginei to perasma 

	CALL ONE_DIGIT	; Kaloume tin One_digit
    
    LEA DX , h   ; EMFANIZOYME TO MINIMA gia to h
	MOV AH , 09H
	INT 21H
	
	RET		; Epistrefo stin thesi apo opou klithike h yporoutina

DISPLAY_HEX ENDP


ONE_DIGIT PROC NEAR
	
	CMP DL,9	; Sygkrinoume to DL me to 9 gia na ksexoriso an o DL exei arithmo 0-9 H metaksi 10-15
	JA GRAMMA	; An o DL einai metaksi 10-15 phgaine stin etiketa "Gramma" gia na emfanistei apo A-F

	ADD DL,48	; Metatrepoume ton arithmo poy exei o DL se xaraktira poy einai antistoixos se ASCII
	JMP NEXTT	; Phgainoyme stin etiketa "Next" giati i epomeni grammi anaferetai gia arithmoys 10-15

GRAMMA:	ADD DL, 'A'-10	; Metatrepoume ton aritho pou einai 10-15 sto antistoixo gramma A-F prosthetontas 55
;/Hexadecimal

NEXTT:	MOV AH,02H	; Emfanizoyme stin othoni to periexomeno tou DL
	    INT 21H 

TELOS:	RET		; Epistrefo stin thesi apo opou klithike h yporoutina

ONE_DIGIT ENDP

KODIKAS ENDS

DEDOMENA SEGMENT
	
    wrong DB 10,13,'Latos gramma :  $';
	MESSAGE DB 10,13,"Eisagete ena Kefalaio charactira: " ,10,13," $" ; To minima pou tha emfanistei
	FINALMES DB 10,13,"TO GRAMMA STO HEX EINAI: " ,10,13," $" ; To minima pou tha emfanistei
	H DB "h" ,10,13," $" ; To minima pou tha emfanistei
DEDOMENA ENDS


	
	END KYRIO
