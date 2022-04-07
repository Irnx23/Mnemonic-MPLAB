#include <p16f877a.inc>

        ORG 0
        GOTO	INICIO


INICIO
	    BSF     STATUS,5;
		MOVLW	0x06;
		MOVWF	ADCON1
		MOVLW	b'00000001'
		MOVWF	PORTA;
        ;BSF		PORTA,0; Entrada [HAY QUE CAMBIAR EL MODO DE ANA a DIG]
        ;BCF		PORTA,4; Salida para led
        MOVLW	b'11111111'; numero binario ENTRADA
        MOVWF	PORTB;
        MOVLW	b'00000000'; numero binario SALIDA
        MOVWF	PORTD;
		
	    BCF	     STATUS,5;
;-------------------------------------------------------------
      
     	BSF		PORTA,5
		CALL	DELAY	
		BCF		PORTA,5

A    	CLRF	PORTD
     	BTFSS	PORTA,0;
		GOTO	A	
		GOTO	LOOP	
LOOP
        CLRF	PORTD
		BSF		PORTA,5
		CALL	DELAY	
		BCF		PORTA,5
        MOVLW	0X20
		MOVWF	FSR

DATOS
        ;BANKSEL PORTB	
		MOVFW	PORTB ; Lee el puerto B
		MOVWF	INDF; Lo mueve al registro
		BSF		PORTA,5
		CALL	DELAY	
		BCF		PORTA,5
		CALL	DELAY
		INCF	FSR	
		BTFSS	FSR,.3
		GOTO	DATOS
		
		MOVLW	0X20
		MOVWF	FSR

LECTURA
		MOVFW	INDF
		MOVWF	PORTD
		call	DELAY
		INCF	FSR
		BTFSS	FSR,.03
		GOTO	LECTURA

GOTO	A
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

END
