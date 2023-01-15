;@NOMBRE: P2-Display_7SEG
;@fecha: 15/01/2023
;@Descripcion:un programa que permita mostrar los 
; valores alfanuméricos(0-9 y A-F) en un display de 
; 7 segmentos ánodo común, conectados al puerto D.    
;AUTOR:Palacios Gomez Paulo Adrian
    
    
PROCESSOR 18F57Q84
    
#include "config_bits.inc" /config statements should precede project file includes./
#include "retardos_01.inc"
#include <xc.inc>

PSECT resetVect,class=CODE, reloc=2
resetVect:
    goto Main
PSECT CODE
Main:
    CALL    Config_OSC
    CALL    Config_Port
    
    
condicion_button:
    BTFSC PORTA,3,1         ;salta si el bit 3 es cero en el registro PORTA
    GOTO Numeros
    Letras:
	Letra_A:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,3,0   ;colocar el bit 3 en uno del registro PORTD
	  CALL	Delay_1s    
	  BTFSC	PORTA,3,0   ;si el bit 3 del registro PORTA es cero, salta
	  GOTO Numeros
	Letra_b:
	  CLRF	PORTD,0     ;colocar el registro PORTD en cero
	  BSF	PORTD,0,0   ;colocar el bit 0 en uno del registro PORTD
	  BSF	PORTD,1,0   ;colocar el bit 1 en uno del registro PORTD
	  CALL	Delay_1s    
	  BTFSC PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Numeros
	Letra_C:
	  CLRF PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,1,0   ;colocar el bit 1 en uno del registro PORTD
	  BSF	PORTD,2,0   ;colocar el bit 2 en uno del registro PORTD
	  BSF	PORTD,6,0   ;colocar el bit 6 en uno del registro PORTD
	  CALL Delay_1s
	  BTFSC	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Numeros
	Letra_d:
	  CLRF PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,0,0   ;colocar el bit 0 en uno de los registro PORTD
	  BSF	PORTD,5,0   ;colocar el bit 5 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSC	 PORTA,3,0  ;si el bit 3 del registro PORTA es cero, salta
	  GOTO Numeros
	Letra_E:
	  CLRF PORTD,0	    ;colocar el registro PORTD en cero	    
	  BSF	PORTD,1,0   ;colocar el bit 1 en uno de los registros PORTD
	  BSF	PORTD,2,0   ;colocar el bit 2 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSC	PORTA,3,0   ;si el bit 3 del registro PORTA es cero, salta
	  GOTO	Numeros
	Letra_F:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,1,0   ;colocar el bit 1 en uno de los registros PORTD
	  BSF	PORTD,2,0   ;colocar el bit 2 en uno de los registros PORTD
	  BSF	PORTD,3,0   ;colocar el bit 3 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSC PORTA,3,0   ;si el bit 3 del registro PORTA es cero, salta
	  GOTO Numeros
	  GOTO Letras
	  
     Numeros:
	Numero_00:
	  CLRF PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,6,0   ;colocar el bit 6 en uno de los registros PORTD
	  CALL Delay_1s	    
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero, salta
	  GOTO Letras
	Numero_01:
	  SETF	PORTD,0	    ;colocar el registro PORTD en uno
	  BCF	PORTD,1,0   ;colocar el bit 1 en cero de los registros PORTD
	  BCF	PORTD,2,0   ;colocar el bit 2 en cero de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero, salta
	  GOTO Letras
	Numero_02:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,2,0   ;colocar el bit 2 en uno de los registros PORTD
	  BSF	PORTD,5,0   ;colocar el bit 5 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	Numero_03:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,4,0   ;colocar el bit 4 en uno de los registros PORTD
	  BSF	PORTD,5,0   ;colocar el bit 5 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	Numero_04:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,0,0   ;colocar el bit 0 en uno de los registros PORTD
	  BSF	PORTD,3,0   ;colocar el bit 3 en uno de los registros PORTD
	  BSF	PORTD,4,0   ;colocar el bit 4 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	Numero_05:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,1,0   ;colocar el bit 1 en uno de los registros PORTD
	  BSF	PORTD,4,0   ;colocar el bit 4 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	 Numero_06:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,1,0   ;colocar el bit 1 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	 Numero_07:
	  SETF	PORTD,0	    ;colocar el registro PORTD en uno
	  BCF	PORTD,0,0   ;colocar el bit 0 en cero de los registros PORTD
	  BCF	PORTD,1,0   ;colocar el bit 1 en cero de los registros PORTD
	  BCF	PORTD,2,0   ;colocar el bit 2 en cero de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	 Numero_08:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	 Numero_09:
	  CLRF	PORTD,0	    ;colocar el registro PORTD en cero
	  BSF	PORTD,3,0   ;colocar el bit 3 en uno de los registros PORTD
	  BSF	PORTD,4,0   ;colocar el bit 4 en uno de los registros PORTD
	  CALL Delay_1s
	  BTFSS	PORTA,3,0   ;si el bit 3 del registro PORTA es cero,salta
	  GOTO Letras
	  GOTO Numeros
Config_OSC:
    ;configuración del Oscilador interno a una frecuencia de 4Mhz
    BANKSEL OSCCON1
    MOVLW 0x60	;seleccionamos el bloque del oscilador interno con un div:1
    MOVWF OSCCON1
    MOVLW 0X02	;seleccionamos a una frecuencia de 4Mhz
    MOVWF OSCFRQ
    RETURN
 
Config_Port:	;PORT-LAT-ANSEL-TRIS LED:RF3,  BUTTON:RA3
    ;Config Button
    BANKSEL LATA
    CLRF    LATA,1	;PORTA<7,0> = 0
    CLRF    ANSELA,1	;PORTA DIGITAL
    BSF	    TRISA,3,1	;RA3 COMO ENTRADA
    BSF	    WPUA,3,1	;ACTIVAMOS LA RESISTENCIA PULLUP DEL PIN RA3
    ;Config Port D
    BANKSEL PORTD
    SETF    PORTD,1	;PORTE<7,0> = 1
    CLRF    ANSELD,1	;PORTE DIGITAL
    CLRF    TRISD,1	;PORTE COMO SALIDA
    RETURN

END resetVect


