TITLE examsA
KODIKAS SEGMENT PUBLIC
ASSUME CS:KODIKAS, DS:DEDOMENA
ARXH:
	    MOV AX,DEDOMENA ; Apokatastash tou DS
	    MOV DS,AX	; Apokatastash tou DS
    
  	    LEA DX,PROTROPI
	    MOV AH,09H	; Typwnoume to mhnyma
	    INT 21H	

	    MOV SI,0	; Eisagoume arxiki timi ston SI pou ton xrisimopoio san deikti mnimis

INPUT:	MOV AH,01H  ; Eisagoume xarakthra apo to plhktrologio me parallhlh emfanish
	    INT 21H		; H ASCII timh tou xarakthra apothikeuetai ston AL

	    CMP AL,'*'	; Elegxoume an patithike to ENTER (opote o AL tha apoktouse thn ASCII timh 13) 
	    JE Emfanisi	; An NAI phgaine stin etiketa "Emfanisi"

        CMP AL,32	; Elegxoume an patithike to SPACE (opote o AL tha apoktouse thn ASCII timh 32)
	    JE INSERT		; An NAI phgaine sto "B7"
        
	    CMP AL,'A'	; Sygkrinoume auto pou patithike me tin ASCII timi tou A
	    JB INPUT		; An einai mikroteri i ASCII timi tou pane sto "B2" gia ton epomeno xaraktira

	    CMP AL,'Z'	; Sygkrinoume auto pou patithike me tin ASCII timi tou Z 
	    JA INPUT
	    
INSERT: MOV BUFFER[SI],AL; Metaferoume to xaraktira sti mnimi sti thesi "Buffer+timi tou SI"
	    INC SI		; Afksanoume ton deikti mnimis kata ena

	    CMP SI,15	; Sygkrinoume an exei symplirothi o apitoumenos arithmos
	    JB INPUT		; an OXI pane sto "B2" gia ton epomeno xaraktira

Emfanisi:
    	MOV CX,SI	; Dinoume arxiki timi ston metriti epanalipseon pou einai o CX
	    JCXZ TELOS	; Elegxoume an o CX den einai 0 allios phgaine stin etiketa "Telos"
	    MOV SI,0	; Dinoume arxiki timi ston SI pou ton xrisimopoio san deikti mnimis
	
	    LEA DX,MESSAGE
	    MOV AH,09H	; Typwnoume to mhnyma
	    INT 21H	

E2:	    MOV DL,BUFFER[SI]; Metaferoume ena xaraktira apo ti thesi "Buffer+timi tou SI" ston DL
          
          
E3:     
        CMP DL,32	; Sygkrinoume an O DL exei timi tou SPACE
	    JE KENO		; An einai to keno pane sto "E4" 


        mov al ,dl  ; perno tin ascci timi toy grammatos sto al
        mov ah, 0      ; MHDENIZW TO AH, WSTE NA GINEI H DIAIRESH TOU AX ME TO 2
        mov bl ,2 
        div bl
        cmp ah, 0 
        jne  monos   ; AN den EINAI 0 TOTE i ascii timi toy gragmmatos itan monos        
                
ZIGOS:  
        add dl,12    ; AFKSANA TIN TIN TOY GRAMMA TOS KATA 12
        JMP E4       ; PIGENE EMFANISETO STO STEP E4
        
KENO:
        MOV DL, '#'    ; BGALE APO TO DL TO SPACE KAI BALE TO #
        JMP E4      ; PIGENE STO STEP 4 KAI EMFANISE TO #
            
monos:
        ADD DL,32   ; Metatrepoume to xaraktira apo Kefalaio se Mikro
        JMP E4      ; Prospername tin epomeni metatropi
        
		CMP DL,'Z'	; Sygkrinoume auto pou patithike me tin ASCII timi tou A 
	    JA E3		; ///An einai megaliteri i ASCII timi tou pane sto "B2" gia ton epomeno xaraktira

E4:	    MOV AH,02H	; Emfanizoume to periexomeno toy DL
	    INT 21H		;
	    INC SI		; Afksanoume ton deikti mnimis kata ena

E5:	    LOOP E2	    ; Epanalambanoume ta bhmata apo "E2" mexri "E4" 
        ;LOOP E2 kathe fora cx-- , einai to plithnos char (cx=si)
		
        JMP EXIT
Telos:	
        LEA DX,NOINPUT
	    MOV AH,09H	; Typwnoume to mhnyma
	    INT 21H	
EXIT:	    
        MOV AH,4CH	; Eksodos sto leitoyrgiko systhma
    	INT 21H

KODIKAS ENDS

DEDOMENA SEGMENT
	BUFFER DB 15 DUP(0) ; Dilosi enos pinaka me onoma Buffer 
    PROTROPI DB 'Eisagete keimeno:  $';
	MESSAGE DB 10,13,10,13,'H metatropi se mikra einai: $' ; To minima pou tha emfanistei
	NOINPUT DB 10,13,'Den eisagate kanena orthos charaktira. Telos programmatos$';						
DEDOMENA ENDS

END ARXH