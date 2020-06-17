
_interrupt:

;MyProject.c,4 :: 		void interrupt()
;MyProject.c,6 :: 		switch(LED)
	GOTO        L_interrupt0
;MyProject.c,8 :: 		case 0:
L_interrupt2:
;MyProject.c,10 :: 		TMR0L = 0x90;
	MOVLW       144
	MOVWF       TMR0L+0 
;MyProject.c,11 :: 		TMR0H = 0xE8;
	MOVLW       232
	MOVWF       TMR0H+0 
;MyProject.c,12 :: 		break;
	GOTO        L_interrupt1
;MyProject.c,14 :: 		case 1:
L_interrupt3:
;MyProject.c,16 :: 		TMR0L = 0x50;
	MOVLW       80
	MOVWF       TMR0L+0 
;MyProject.c,17 :: 		TMR0H = 0xC9;
	MOVLW       201
	MOVWF       TMR0H+0 
;MyProject.c,18 :: 		break;
	GOTO        L_interrupt1
;MyProject.c,20 :: 		}
L_interrupt0:
	BTFSS       RD0_bit+0, BitPos(RD0_bit+0) 
	GOTO        L_interrupt2
	BTFSC       RD0_bit+0, BitPos(RD0_bit+0) 
	GOTO        L_interrupt3
L_interrupt1:
;MyProject.c,21 :: 		LED = !LED;
	BTG         RD0_bit+0, BitPos(RD0_bit+0) 
;MyProject.c,22 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;MyProject.c,23 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,25 :: 		void main()
;MyProject.c,27 :: 		TRISD.RD0 = 0;
	BCF         TRISD+0, 0 
;MyProject.c,29 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;MyProject.c,30 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;MyProject.c,31 :: 		TMR0IP_bit = 1;
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;MyProject.c,32 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MyProject.c,34 :: 		LED = 1;
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;MyProject.c,35 :: 		TMR0L = 0x50;
	MOVLW       80
	MOVWF       TMR0L+0 
;MyProject.c,36 :: 		TMR0H = 0xC9;
	MOVLW       201
	MOVWF       TMR0H+0 
;MyProject.c,38 :: 		T0CON = 0b10001000;
	MOVLW       136
	MOVWF       T0CON+0 
;MyProject.c,40 :: 		while(1){}
L_main4:
	GOTO        L_main4
;MyProject.c,41 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
