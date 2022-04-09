; DIAGRAMA:
; DIPSWITCH EN PORTB Y SALIDAS EN PORTD

#include <p16f877a.inc>

        ORG 0
        GOTO	INICIO


INICIO
	    BSF     STATUS,5;
		MOVWF	PORTA;
        MOVLW	b'11111111'; numero binario ENTRADA
        MOVWF	PORTB;
        MOVLW	b'00000000'; numero binario SALIDA
        MOVWF	PORTD;
		
	    BCF	     STATUS,5;
;-------------------------------------------------------------

STR
		MOVFW	PORTB;
		MOVWF	PORTD;
		CALL	DELAY;
 
;------------------------------------------------------------------------------
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
