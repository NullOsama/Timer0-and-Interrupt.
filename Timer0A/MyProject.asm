
_interrupt:

;MyProject.c,4 :: 		void interrupt()
;MyProject.c,6 :: 		LED = !LED;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;MyProject.c,8 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;MyProject.c,9 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;MyProject.c,11 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;MyProject.c,12 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,15 :: 		void main()
;MyProject.c,17 :: 		TRISD.RD0 = 0;
	BCF         TRISD+0, 0 
;MyProject.c,18 :: 		LED = 0;
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;MyProject.c,20 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;MyProject.c,21 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;MyProject.c,22 :: 		TMR0IP_bit = 1;
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;MyProject.c,23 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MyProject.c,25 :: 		TMR0L = 0xF0;
	MOVLW       240
	MOVWF       TMR0L+0 
;MyProject.c,26 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;MyProject.c,28 :: 		T0CON = 0b10001000;
	MOVLW       136
	MOVWF       T0CON+0 
;MyProject.c,30 :: 		while(1){}
L_main0:
	GOTO        L_main0
;MyProject.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
