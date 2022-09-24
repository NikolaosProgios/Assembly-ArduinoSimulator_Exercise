eLEGXOS SOSTIS SEIRAS (MOV,INT KTLP)
ALLA KAI X: Y: , NA SINEXIZEI TO ENA 
STO ALLA META .

(print DL)(ADD 48)
MOV AH,2  ; METAFEROYME STON AH TO 2 GIA NA MPOROYME NA EMFANISOYME TO PERIEXOMENO TOY DL
(intput keryboard)
mov ah,8  ; κλήση του DOS για εισαγωγή χαρακτήρα από το πληκτρολόγιο 
(LEA messeage)
MOV AH,09H	; Typwnoume to mhnyma

MOV AH,4CH  ; telos to programma 

inc al (al++)
dec al (al--)

JE  =
JNE != 
JB  <

JBE  <= 

JA  >
jmp

MOV AH , 0 ; oste mono to al na meinei
AX|BL
______
AH|AL
  |
  |
-  
MOV AH,0	    ; MHDENIZW TO AH, WSTE NA GINEI H DIAIRESH TOU AX ME TO 2
MOV BL,2	    ; BAZW TO 2 STON BL
DIV BL		    ; DIAIRW ME TO 2
CMP AH,0	    ; ELEGXW TO YPOLOIPO
JE ARTIOS	    ; AN EINAI 0 TOTE O ARITHMOS HTAN ARTIOS

jexademical

	MOV BL,DL	; Metafero to periexomeno tou DL se allo kataxoriti giati ton xriazomai kai pali

	MOV BH,0	; Mizenizo ton BH kai etsi ksero oti o BX exei ayto pou eixe o BL
	MOV CL,4	; Bazo ston CL 4 gia na exo toses epanalipseis

	SHL BX,CL	; Metatopizo aristera ton BX tosa bit osa exei o CL
	MOV DL,BH	; Metaferoume ton proto hex arithmo apo ton BH ston DL gia na ginei to perasma 

	CALL ONE_DIGIT	; Kaloume tin One_digit 