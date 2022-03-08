#include <p16f877a.inc>

   ORG 0
   ORG 0X10
	
	BSF     STATUS,5
	CLRF    PORTD
    MOVLW	0XFF	
	MOVWF	PORTB
    MOVWF   PORTC
    BCF		STATUS,5

	CLRF 	PORTD
	CLRF	PORTB	
	CLRF	PORTC
	GOTO	INICIO
;-----------------------------------------------------------------------
INICIO ; QUINCE
      BTFSS	PORTB,0 ;1
      GOTO	A1
      BTFSS	PORTB,1 ; 2
      GOTO	A1
      BTFSS	PORTB,2 ; 4
      GOTO	A1
      BTFSS	PORTB,3; 8
      GOTO A1
      MOVLW	b'00001111'
      MOVWF	PORTD
      CALL DELAY
      GOTO INICIO

A1 ; CATORCE
      BTFSS	PORTB,1;2
      GOTO A2
      BTFSS	PORTB,2;4
      GOTO	A2
      BTFSS	PORTB,3 ; 8
      GOTO A2
      MOVLW b'00001110'
      MOVWF	PORTD
      CALL DELAY 
      GOTO INICIO

A2; TRECE
      BTFSS PORTB,0;1
      GOTO A3
      BTFSS	PORTB,2;4
      GOTO A3
      BTFSS	PORTB,3;8
      GOTO A3
      MOVLW b'00001101'
      MOVWF	PORTD
      CALL DELAY
      GOTO INICIO

A3; DOCE
      BTFSS	PORTB,2;4
      GOTO A4
      BTFSS PORTB,3; 8
      GOTO A4
      MOVLW b'00001100'
      MOVWF PORTD 
      CALL	DELAY
      GOTO INICIO
A4;ONCE
      BTFSS PORTB,0;1
      GOTO A5
      BTFSS	PORTB,1;2
      GOTO A5
      BTFSS	PORTB,3;8
      GOTO A5
      MOVLW b'0001011'
      MOVWF	PORTD
      CALL DELAY
      GOTO INICIO

A5; DIEZ
      BTFSS	PORTB,1;2
      GOTO   A6
       BTFSS PORTB,3; 8
       GOTO  A6
       MOVLW b'00001010'
       MOVWF PORTD
       CALL	DELAY
       GOTO  INICIO

A6;NUEVE
       BTFSS	PORTB,0;1
       GOTO		A7
       BTFSS	PORTB,3; 8
       GOTO 	A7
       MOVLW	b'00001001'
       MOVWF	PORTD
       CALL     DELAY
       GOTO     INICIO
A7; OCHO
       BTFSS	PORTB,3;8
       GOTO		A8
       MOVLW	b'00001000'
       MOVWF	PORTD
       CALL		DELAY
       GOTO		INICIO
A8; SIETE
       BTFSS	PORTB,0;1
       GOTO		A9
       BTFSS	PORTB,1;2
       GOTO		A9
       BTFSS	PORTB,2;4
       GOTO		A9
       MOVLW	b'00000111'
       MOVWF	PORTD
       CALL		DELAY
       GOTO 	INICIO

A9; SEIS
       BTFSS	PORTB,1;2
       GOTO		A10
       BTFSS	PORTB,2;4
       GOTO 	A10
       MOVLW	b'00000110'
       MOVWF	PORTD
       CALL		DELAY
       GOTO 	INICIO

A10;CINCO
         BTFSS	PORTB,0;1
         GOTO	A11
         BTFSS	PORTB,2;4
         GOTO	A11
         MOVLW	b'00000101'
         MOVWF	PORTD
         CALL	DELAY
		 GOTO	INICIO

A11;CUATRO
        BTFSS	PORTB,3;4
        GOTO	A12
        MOVLW	b'00000100'
        MOVWF	PORTD
        CALL	DELAY
        GOTO	INICIO

A12;TRES
        BTFSS	PORTB,0;1 
        GOTO	A13
        BTFSS	PORTB,1;2
        GOTO	A13
        MOVLW	b'00000011'
        MOVWF	PORTD
        CALL	DELAY
		GOTO   INICIO
A13; DOS
        BTFSS	PORTB,1;2
        GOTO	A14
        MOVLW	b'00000010'
        MOVWF	PORTD
        CALL	DELAY
        GOTO	INICIO
    
A14; UNO
         BTFSS	PORTB,0;1
         GOTO	A15
         MOVLW  b'00000001'
         MOVWF	PORTD
         CALL	DELAY
         GOTO	INICIO
A15; CERO 
         CLRF	PORTD;0
         CALL	DELAY	
         GOTO   INICIO

       RETURN
;----------------------------------------------------------------
DELAY

    	MOVLW	0X08
    	MOVWF	0X20
     	MOVLW	0XFF
    	MOVWF	0X21
LOOP1   MOVWF	0X22
LOOP2	DECFSZ	0X22,1
		GOTO	LOOP2
		DECFSZ	0X21,1
		GOTO 	LOOP1
		RETURN

END