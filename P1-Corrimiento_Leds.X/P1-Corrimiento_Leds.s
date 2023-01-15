;@NOMBRE: P1-Corrimiento_Leds
;@fecha: 15/01/2023
;@Descripcion:
;Desarrollar un programa que permita realizar un
;corrimiento de leds conectados al puerto C, con
;un retardo de 500 ms en un numero de
;corrimientos pares y un retardo de 250ms en un
;numero de corrimientos impares.
;AUTOR:Palacios Gomez Paulo Adrian
    
    
PROCESSOR 18F57Q84
#include "config_bits.inc"  // config statements should precede project file includes.
#include <xc.inc>  

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT udata_acs
contador1: DS 1   
contador2: DS 1            ; reserva 1 byte en access ram
contador3: DS 1    
    
PSECT CODE
 
Main:
     CALL Config_OSC,1
     CALL Config_Port,1

BUTTON:
    BANKSEL   LATA      ;colocamos todos en un mismo banco
    CLRF      LATC,b	;el contenido de LATC se coloca en cero
    BCF       LATE,1,b	;pone en cero el bit 1 del registro LATE
    BCF       LATE,0,b	;pone en cero el bit 0 del registro LATE
    BTFSC     PORTA,3,b	;si el bit 3 es cero salta a la siguiente instruccion
    goto      BUTTON	;saltar a la etiqueta BUTTON
    goto      PAR	;saltar a la etiqueta PAR
     
PAR:
    CLRF  LATC,b	;el contenido de LATC se coloca en cero
    BCF   LATE,0,b	;pone en cero el bit 0 del registro LATE
    BSF   LATE,1,b	;pone en uno el bit 1 del registro LATE
    MOVLW 00000010B	;colocar en W el valor de 2 en binario
    MOVWF LATC,1	;copiar el valor de w al registro LATC
    CALL  Delay_500ms,1	;Saltar a la subrutina Delay_500ms	
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON1	;saltar a la etiqueta BUTTON1
    
    BSF   LATE,1,b	;Pone en uno el bit 1 del registro LATE
    BCF   LATE,0,b	;Pone en cero el bit 0 del registro LATE
    MOVLW 00001000B	;colocar en W el valor de 8 en binario
    MOVWF LATC,1	;copiar el valor de w al LATC
    CALL  Delay_500ms,1	;saltar a la subrutina Delay_500ms
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON1	;saltar a la etiqueta BUTTON1
    
    BSF   LATE,1,b	;Colocar el bit 1 del registro LATE en 1
    BCF   LATE,0,b	;Colocar el bit 0 del registro LATE en 0
    MOVLW 00100000B	;Colocar en W el valor de 32 en binario
    MOVWF LATC,1        ;copiar el valor de w al LATC
    CALL  Delay_500ms,1	;saltar a la subrutina Delay_500ms
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON1	;saltar a la etiqueta BUTTON1
    
    
    BSF   LATE,1,b      ;Colocar el bit 1 del registro LATE en 1
    BCF   LATE,0,b	;colocar el bit 0 del registro LATE en 0
    MOVLW 10000000B	;Colocar el valor de 128 en binario
    MOVWF LATC,1	;copiar el valor de w a LATC
    CALL  Delay_500ms,1	;saltar a la subrutina Delay_500ms
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON1	;saltar a la etiqueta BUTTON1
    
 IMPAR:
    CLRF  LATC,b	;el contenido de LATC  se coloca en cero
    BCF   LATE,1,b	;el bit 1 del registro LATE se coloca en 0
    BSF   LATE,0,b	;el bit 0 del registro LATE se coloca en 1
    MOVLW 00000001B	;se coloca en w el valor de 1 en binario
    MOVWF LATC,1	;se copia el valor del w al registro
    CALL  Delay_250ms,1 ;saltar a la subrutina Delay_250ms
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON2       ;saltar a la etiqueta BUTTON2
    
    BCF   LATE,1,b	;el bit 1 del registro LATE se coloca en 0
    BSF   LATE,0,b      ;el bit 0 del registro LATE se coloca en 1
    MOVLW 00000100B     ;se coloca en w el valor de 4 en binario
    MOVWF LATC,1        ;se copia el valor del w al registro
    CALL  Delay_250ms,1	;saltar a la subrutina Delay_250ms
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON2	;saltar a la etiqueta BUTTON2
    
    BCF   LATE,1,b	;el bit 1 del registro LATE se coloca en 0
    BSF   LATE,0,b      ;el bit 0 del registro LATE se coloca en 1
    MOVLW 00010000B     ;se coloca en w el valor de 16 en binario
    MOVWF LATC,1	;se copia el valor del w al registro
    CALL  Delay_250ms,1	;saltar a la subrutina Delay_250ms
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON2	;saltar a la etiqueta BUTTON2
    
    
    BCF   LATE,1,b	;el bit 1 del registro LATE se coloca en 0
    BSF   LATE,0,b	;el bit 0 del registro LATE se coloca en 1
    MOVLW 01000000B	;se coloca en w el valor de 64 en binario
    MOVWF LATC,1	;se copia el valor del w al registro
    CALL  Delay_250ms,1	;saltar a la subrutina Delay_250ms
    BTFSS PORTA,3,0	;saltar a la siguiente instruccion si el bit 3 es 1
    GOTO  BUTTON2	;saltar a la etiqueta BUTTON2
    GOTO  PAR		;saltar a la etiqueta PAR
    
BUTTON1:
    CALL    Delay_250ms,1;saltar a la subrutina Delay_250ms
    BTFSC   PORTA,3,0	 ;saltar a la siguiente instruccion si el bit 3 es 0
    GOTO    BUTTON1	 ;saltar a la etiqueta BUTTON1
    GOTO    PAR		 ;saltar a la etiqueta PAR
    
BUTTON2:
    CALL    Delay_250ms,1;saltar a la subrutina Delay_250ms
    BTFSC   PORTA,3,0	 ;saltar a la siguiente instruccion si el bit 3 es 0
    GOTO    BUTTON1	 ;saltar a la etiqueta BUTTON1
    GOTO    IMPAR        ;saltar a la etiqueta IMPAR
    
    
    
;    NOP
;    CLRF  LATC,b
;    BCF   LATE,1,b
;    BCF   LATE,0,b
;    BTFSS PORTA,3,b
;    GOTO  BUTTON1
;    GOTO  BUTTON
  
;BUTTON2:
;    NOP
;    CLRF  LATC,b
;    BCF   LATE,1,b
;    BCF   LATE,0,b
;    BTFSS PORTA,3,b 
;    GOTO  BUTTON2
;    GOTO  BUTTON
    
    
Config_OSC:
        ;Configuracion del Oscilador interno a una frecuencia interna de 4Mhz 
         BANKSEL OSCCON1
	 MOVLW 0X60     ;Seleccionamos el bloque del osc con un Div:1
	 MOVWF OSCCON1,1
	 MOVLW 0X02     ;Seleccionamos una Frecuencia de 4Mhz
	 MOVWF OSCFRQ ,1
         RETURN

Config_Port:   ;PORT-LAT-ANSEL-TRIS  LED:RF3,  BUTTON:RA3
    ;Config Led
    BANKSEL  PORTF
;    CLRF     PORTF,b    ;PORTF = 0
;    BSF      LATF,3,b   ;LATF<3> = 1 - Led off
;    CLRF     ANSELF,b   ;ANSELF<7:0> = 0 - Port F digital
;    BCF      TRISF,3,b  ;TRISF<3> = 0  RF3 como Salida
    CLRF     TRISC,b    ;TRISC = 0 Como salida
    CLRF     ANSELC,b   ;ANSELC<7:0> = 0 - Port C digital
    BCF      TRISE,1,b  ;TRISF<1> = 0  RE1 como SALIDA
    BCF      TRISE,0,b  ;TRISF<0> = 0  RF0 como SALIDA
    BCF      ANSELE,1,b  ;TRISF<1> = 0  RE1 como Digital
    BCF      ANSELE,0,b  ;TRISF<0> = 0  RE0 como Digital
    
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,b     ;PortA<7:0> = 0 
    CLRF    ANSELA,b    ;PortA Digital
    BSF     TRISA,3,b   ;RA3 como entrada
    BSF     WPUA,3,b    ;Activamos la resistencia Pull-up del pin RA3
    RETURN   

;T= (6 + 4k1)(k2)(k3)us            1Tcy=1us   
Delay_500ms:
    MOVLW   2               ;1Tcy--k3
    MOVWF   contador3,0     ;1Tcy
D_500ms:                ;2Tcy--call
    MOVLW   250             ;1Tcy--k2
    MOVWF   contador2,0     ;1Tcy
    
Ext500ms_Loop:                  
    MOVLW   249             ;1Tcy--k1
    MOVWF   contador1,0     ;1Tcy
Int500ms_Loop:
    NOP                     ;K1*Tcy
    DECFSZ  contador1,1,0   ;(k1-1)+ 3Tcy           
    GOTO    Int500ms_Loop   ;2Tcy
    DECFSZ  contador2,1,0   ;2Tcy
    GOTO    Ext500ms_Loop   ;2Tcy 
    DECFSZ  contador3,1,0
    GOTO    D_500ms
    RETURN                  ;2Tcy   
 ;--------------------------
 ;--------------------------
;T= (6 + 4k1)k2us            1Tcy=1us   
Delay_250ms:                ;2Tcy--call
    MOVLW   250             ;1Tcy--k2
    MOVWF   contador2,0     ;1Tcy
    
Ext250ms_Loop:                  
    MOVLW   249             ;1Tcy--k1
    MOVWF   contador1,0     ;1Tcy
Int250ms_Loop:
    NOP                     ;K1*Tcy
    DECFSZ  contador1,1,0   ;(k1-1)+ 3Tcy           
    GOTO    Int250ms_Loop   ;2Tcy
    DECFSZ  contador2,1,0   ;2Tcy
    GOTO    Ext250ms_Loop   ;2Tcy   
    RETURN                  ;2Tcy     
    
END resetVect



