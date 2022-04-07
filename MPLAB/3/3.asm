#include <p16f877a.inc>


		ORG 0
		GOTO	INICIO
		ORG		10

;0 son salidas y 1 son entrada

INICIO

		BSF	    STATUS,5
		MOVLW	0X06; ACTIVA EL PUERTO A
		MOVWF	ADCON1; ACTIVA EL PUERTO A
;ANALOGICO A DIGITAL
;--------------------------------------------------------------------
		CLRF	PORTD; SALIDA DEL PUERTO D
		MOVLW	b'00001111'; CARGA EN EL ACUMULADOR W
		MOVWF	PORTB; CONVIERTE EL PUERTO B EN ENTRADAS
		MOVWF	PORTA; CONVIERTE EL PUERTO A EN ENTRADAS
		MOVWF	PORTC; 
		BCF		OPTION_REG,7;
		BCF		STATUS,5;
;----------------------------------------------------------------------------
		CLRF	PORTD; LIMPIA EL PUERTO D
		CLRF	PORTC;
		CLRF	PORTB;
        BCF		STATUS,IRP; Colocar en 0 la bandera 

        MOVLW	0X20; Mueve este valor
		MOVWF	FSR; a este espacio
;-----------------------------------------------------------------------------
START
		BTFSC 	PORTA,0; Revisa la entrada
		GOTO	START; si es 1 regresa a start
        MOVFW	PORTB; Mueve el valor del puerto B a W
		MOVWF	0X32; De w lo mueve al registro 32
		MOVFW	PORTC; Mueve el puerto C a W
		SWAPF	PORTC,0; Bit mas significativo al menos significativo y se queda en W
		IORWF	0X32,0; Realiza una compuerta OR (Suma) y el resultado se queda en W
		MOVWF	PORTD; Hacia el puerto D
;------------------------------------------------------------------------------
		MOVWF	INDF; Y Al registro del FSR
        INCF	FSR; Incrementa +1 -- 0x20 -- 0x21-- 0x22
        CALL	DELAY;
	    CLRF	PORTD; limpia el puerto D

        MOVFW	FSR; Mueve el registro FSR a w para comparar
		XORLW	0X2A; desde 0x20,0x21,0x22,0x23,0x24,0x25,0x26,027,0x28,0x29,0x2A
        BTFSS	STATUS,Z; Revisa la Bandera/ 
  		GOTO	START; Si es 0 se regresa a START
;-----------------------------------------------------------------------------
V       BTFSC	PORTA,1; Si es 0 se queda en un Loop
		GOTO	OK; Si es 1, salta

    	MOVLW	0X20 ; Mueve este valor
		MOVWF	FSR; A este espacio
;--------------------------------------------------------------------------
LECTURA
		MOVFW	INDF ; 
		MOVWF	PORTD

		CALL	DELAY
		CLRF	PORTD
		CALL	DELAY

		INCF	FSR
	    MOVF	FSR,W
		XORLW	0X2A;
		BTFSS	STATUS,Z
		GOTO	LECTURA
        CLRF	PORTD
        GOTO	START

OK	
        BTFSC	PORTA,0;
		GOTO    V
        MOVFW	PORTB; Mueve el valor del puerto B a W
		MOVWF	0X33; De w lo mueve al registro 33
		MOVFW	PORTC; Mueve el puerto C a W
		SWAPF	PORTC,0; Bit mas significativo al menos significativo y se queda en W
		IORWF	0X33,0; Realiza una compuerta OR (Suma) y el resultado se queda en W
		MOVWF	PORTD; Hacia el puerto D
		CALL	DELAY
		CLRF	PORTD
		GOTO	V



	
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
