#include<p16f877a.inc>

	ORG 0
    GOTO INICIO

INICIO

	BSF	    STATUS,5;
	CLRF	PORTC
	CLRF	PORTC;
    BCF		STATUS,5;
	BSF		STATUS, RP0
	BCF		STATUS,RP1
	CLRF	TRISC;
	CLRF	ADCON1;
	BCF		STATUS,RP0
	BCF		STATUS, RP1
	BSF		ADCON0,ADON;
	;BSF		ADCON0,ADCSO;

START
;-------------------------------------------------
;Enciende y apaga el LED
	CLRF	PORTC
	BSF		PORTC,0
	BSF		PORTC,1
	BSF		PORTC,2
	CALL	DELAY
	CLRF	PORTC
	CALL	DELAY
	BSF		PORTC,0
	BSF		PORTC,1
	BSF		PORTC,2
	CALL	DELAY
	CLRF	PORTC;
	CALL	DELAY
	BSF		PORTC,0
	BSF		PORTC,1
	BSF		PORTC,2
	CALL	DELAY
	CLRF	PORTC
	CALL	DELAY;
;--------------------------------------------------
; INICIO DE LECTURA Analogica
    GOTO 	START


;--------------------------------------------------	
DELAY
     	MOVLW	0X08
    	MOVWF	0X30
     	MOVLW	0XFF
    	MOVWF	0X31
LOOP1   MOVWF	0X32
LOOP2	DECFSZ	0X32,1
		GOTO	LOOP2
		DECFSZ	0X31,1
		GOTO 	LOOP1
		RETURN



END
