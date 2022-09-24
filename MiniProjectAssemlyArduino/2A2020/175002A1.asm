;Progios Nikolaos ; 175002
;.MODEL SMALL
;.STACK 100H
;.CODE
TITLE Exams_175002
KODIKAS SEGMENT PUBLIC
ASSUME CS:KODIKAS, DS:DEDOMENA,
    KYRIO PROC NEAR
                    ; OI 2 PARAKATO ENTOLES APOKATHISTOYN THN TIMH TOY DS.
	    MOV AX,DEDOMENA 
	    MOV DS,AX
	    
	    MOV SI,0	; Eisagoume arxiki timi ston SI pou ton xrisimopoio san deikti mnimis      
B2: 
  	    LEA DX,MESHIGH  ; BAZOYME TH DIEYTHINSI MNIMIS TOY MESSAGE STON DX
	    MOV AH,09H	    ; METAFEROYME STON AH TO 9 GIA NA MPOROYME NA EMFANISOYME TO MESSAGE
	    INT 21H	        ; KALOYME TO LEITOYRGIKO SYSTIMA NA EMFANISEI STIN OTHONI TO MESSAGE         
   	
        MOV AH,08H  ; Eisagoume xarakthra apo to plhktrologio 
	    INT 21H		; H ASCII timh tou xarakthra apothikeuetai ston AL

	    CMP AL,'A'	; Sygkrinoume auto pou patithike me tin ASCII timi tou A
	    Jb  minima		; An einai mikroteri i ASCII timi tou pane sto "MINIMA" gia EMFANSI minimatos
B3:
	    CMP AL,'Z'	; Sygkrinoume auto pou patithike me tin ASCII timi tou Z 
	    JA B7		; An einai megaliteri i ASCII timi tou pane sto "MINIMA" gia EMFANSI minimatos
        mov  ch  , al     ; bale sto kefalaio t ch 
        MOV BUFFER[SI],AL; Metaferoume to xaraktira sti mnimi sti thesi "Buffer+timi tou SI"
	    INC SI		; Afksanoume ton deikti mnimis kata ena
B4:
        CMP SI,2	; Sygkrinoume an exei symplirothi o apetoumenos arithmos
	    JB B8		; an OXI pane sto "B2" gia ton epomeno xaraktira
        
        LEA DX ,ALAOK  ; EFANISE MESAGE  TI EMFANIZO TA GRAMMATA
        MOV AH , 09H
        INT 21H
         
        MOV SI , 0      ; BAZO MIDEN STO METRITI
        MOV BL  ,BUFFER[SI] ;PERNO TO PROTO STIXEIO
        MOV DL ,BL        ; TO BZO STON DL GIA EMFANISI
        MOV AH , 2  ; Metaferoyme ston AH to 2 gia na mporoyme na emfanisoyme to periexomeno toy DL
        INT 21H		; Kaloyme to leitoyrgiko systima na emfanisei stin othoni tin ASCII timi poy exei o DL
        
        INC SI    ; AFKSANO TON METRITI
        MOV BH  ,BUFFER[SI]  ;PERNO TO SECON STIXEIO
        MOV DL , BH     ; TO BZO STON DL GIA EMFANISI       
        MOV AH , 2  ; Metaferoyme ston AH to 2 gia na mporoyme na emfanisoyme to periexomeno toy DL
        INT 21H     
                       
        jmp telos
B7:
        ;LEA DX  EDSES MIKRA
        CMP AL , 'z'
        jbe mikra 
B8:
        LEA DX,MESLOW  ; BAZOYME TH DIEYTHINSI MNIMIS TOY MESSAGE STON DX
	    MOV AH,09H	    ; METAFEROYME STON AH TO 9 GIA NA MPOROYME NA EMFANISOYME TO MESSAGE
	    INT 21H
	    JMP  B3

mikra:
       MOV BUFFER[SI],AL; Metaferoume to xaraktira sti mnimi sti thesi "Buffer+timi tou SI"
	   INC SI		; Afksanoume ton deikti mnimis kata ena	    
	   mov cl  , al  ; bale sto mikro sto cl
	   LEA DX   , mikraa 
	   MOV AH , 09H
	   INT 21H
	   
	   CMP SI,2	; Sygkrinoume an exei symplirothi o apetoumenos arithmos	   
	   jmp b2
        
minima:
        Lea dx, wrong ; BAZOYME TH DIEYTHINSI MNIMIS TOY wrong STON DX
        mov ah , 09h
        int 21h
        jmp  B2        ; pigene sto b2, gia tin sinexisi eigagogis grammatos 


 telos: 
 ;afaair apo to cl(mikro)  to cx(megalo)
    
    
    sub cl , ch 
    
    
    
    
    	   
        
    MOV AH,4CH	; Eksodos sto leitoyrgiko systhma
	INT 21H         

KYRIO ENDP 

KODIKAS ENDS

DEDOMENA SEGMENT
	BUFFER DB 2 DUP(0) ; Dilosi enos pinaka me onoma Buffer 20 theseon typou Byte
    wrong DB 10,13,'Latos gramma :  $';
	GRAMMA DB 10,13,'DOSE GRAMMA   : ' ,10,13," $" ;
	ALAOK DB 10,13,'TA GRAMMA EINAI  :  $';
	MESHIGH DB 10,13,"Eisagete ena KEFALAIO charactira: " ,10,13," $" ; To minima pou tha emfanistei
	MESLOW DB 10,13,"Eisagete ena MIKRO charactira: " ,10,13," $" ; To minima pou tha emfanistei
	mikraa  DB 10,13,"edoses MIKRO. DSE MEGALO: " ,10,13," $" ; To minima pou tha emfanistei
	H DB "h" ,10,13," $" ; To minima pou tha emfanistei
DEDOMENA ENDS
	
	END KYRIO
