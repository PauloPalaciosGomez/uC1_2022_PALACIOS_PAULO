PSECT udata_acs
contador_01:  DS 1	    
contador_02:  DS 1
contador_03:  DS 1

    
PSECT CODE    

Delay_250ms:				    ; 2Tcy -- Call
    MOVLW   250				    ; 1Tcy -- k2
    MOVWF   contador_02,0		    ; 1Tcy
; T = (6 + 4k)us			    1Tcy = 1us
    Ext_Loop:		    
	MOVLW   249				    ; 1Tcy -- k1
	MOVWF   contador_01,0		    ; 1Tcy
    Int_Loop:
	NOP					    ; k1*Tcy
	DECFSZ  contador_01,1,0		    ; (k1-1)+ 3Tcy
	GOTO    Int_Loop			    ; (k1-1)*2Tcy
	DECFSZ  contador_02,1,0
	GOTO    Ext_Loop
	RETURN				    ; 2Tcy
;500ms
Delay_500ms:
    MOVLW 2
    MOVWF contador_03,0
	Loop_250ms:				    ;2tcy
	    MOVLW 250				    ;1tcy
	    MOVWF contador_02,0			    ;1tcy
	Loop_1ms:			     
	    MOVLW   249				    ;k Tcy
	    MOVWF   contador_01,0		    ;k tcy
	INT_LOOP:			    
	    Nop					    ;249k TCY
	    DECFSZ  contador_01,1,0		    ;251k TCY 
	    Goto    INT_LOOP			    ;496k TCY
	    DECFSZ  contador_02,1,0		    ;(k-1)+3tcy
	    GOTO    Loop_1ms			    ;(k-1)*2tcy
	    DECFSZ  contador_03,1,0
	    GOTO Loop_250ms
	    RETURN  
