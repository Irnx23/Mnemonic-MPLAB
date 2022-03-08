#include <p16f877a.inc>

		ORG 0
		GOTO INICIO
INICIO
		BSF		STATUS,5;
		CLRF	PORTD
		MOVLW	0XFF	
		MOVWF	PORTB
		BCF		STATUS,5;
		CLRF	PORTD;
;-------------------------------------------------------------------------------
STR
		MOVFW	PORTB; Lee el puerto B y mueve el valor a W
		MOVWF	PORTD; Mueve W al puerto D
        CALL 	DELAY ; 

		GOTO	STR; LOOP
;---------------------------------------------------------------------------
DELAY
        movlw   0x08 ;se mueve esta cantidad
        movwf   0x20 ;Al espacio tal
        movlw   0xFF ;Mueve numero de bits
        movwf   0x21 ;A este espacio de memoria
loop10  movwf   0x22
loop11  decfsz  0x22,1
        goto    loop11
        decfsz  0x21,1  
        goto    loop10
        return
                    
         END