;Programacion con 4 botones y 4 LED's. Utilizando el puerto A y B
;Al oprimir el primer boton, se enciende une vez el primer LED
;Al oprimir el segundo boton, se enciende dos veces el seundo LED
;Y asi sucesivamente.

#include <p16f877a.inc> ;Incluir el pic a utilizar

ORG 0                   ; Origen
goto INICIO             ;Subrutina de inicio
ORG 0X10                ;Origen de la memoria del microcontrolador
;----------------------------------------------------------------------------
;Se declaran las E/S de los puertos
INICIO 
    BSF     STATUS,5    ; Ingresar a la memoria, donde se declaran las E/S
    CLRF    PORTB       ; Comando para colocar todo el Puerto B como salidas

;Se quiere usar el puerto A del pic, el cual es por default es analogico.
    MOVLW  0x06        ; se mueve cierto numeros de bits
    MOVWF   ADCON1      ; al registro ADCON para convertir el puerto A en digital

    MOVLW	0xFF        ; Se mueve ciertos bits 
    MOVWF	PORTA       ;  Al puerto A convirtiendolo en Entradas
    BCF     STATUS,5    ; Salir de la memoria
;-------------------------------------------------------------------------------    
;Para evitar, al comenzar el programa, que mande falsos positivos/negativos
START
    CLRF     PORTB      ; Se limpia el puerto B
    CLRF     PORTA      ; Se limpia el puerto A

;------------------------------------------------------------------------------
STR

LOOP1
     BTFSC   PORTA,0    ; Este comando lee la entrada PA-0
     GOTO    LOOP2      ;Si es 1/On salta aqui y se va a la subrutina LOOP2
     CALL    LED1       ; Si es 0/off salta aqui y llama a la subrutina LED1
     GOTO    STR        ; se va a la subrutina STR
     
;------------------------------------------------------------------------

LOOP2
     BTFSC   PORTA,1
     GOTO    LOOP3
     CALL    LED2
     CALL    LED2
     GOTO    STR

;------------------------------------------------------------------------
LOOP3
     BTFSC   PORTA,2
     GOTO    LOOP4
     CALL    LED3
     CALL    LED3
     CALL	 LED3
     GOTO    STR

;-----------------------------------------------------------------------
LOOP4
    BTFSC   PORTA,3
    GOTO    STR
    CALL    LED4
    CALL    LED4
    CALL	LED4
	CALL	LED4
    GOTO    STR

;////////////////////////////////////////////////////////////////////////////////////////////////
;SUBRUTINAS PARA ENCENDER LED

LED1
    BSF     PORTB,7
    CALL	DELAY
    BCF	    PORTB,7
    CALL	DELAY
    RETURN

;------------------------------------------------------------------------
LED2
    BSF     PORTB,5
    CALL	DELAY
    BCF	    PORTB,5
    CALL	DELAY
    RETURN

;------------------------------------------------------------------------
LED3
    BSF     PORTB,4
    CALL	DELAY
    BCF	    PORTB,4
    CALL	DELAY
    RETURN

;------------------------------------------------------------------------
LED4
    BSF     PORTB,3
    CALL	DELAY
    BCF	    PORTB,3
    CALL	DELAY
    RETURN

;-----------------------------------------------------------------------
;SUBRUTINA DE ESPERA MENOS DE 1SEG.

DELAY
        movlw   0x08 ;se mueve esta cantidad
        movwf   0x20 ;Al espacio tal
        movlw	0xFF ;Mueve numero de bits
     	movwf	0x21 ;A este espacio de memoria
loop10	movwf	0x22
loop11  decfsz	0x22,1
        goto	loop11
        decfsz  0x21,1  
        goto	loop10
        return
        
        END
              
            
     
     
     
     