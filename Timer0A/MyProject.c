sbit LED at RD0_bit;


void interrupt()
{
 LED = !LED;
 
 TMR0L = 0xF0;
 TMR0H = 0xD8;

 TMR0IF_bit = 0;
}


void main() 
{
 TRISD.RD0 = 0;
 LED = 0;
 
 TMR0IF_bit = 0;
 TMR0IE_bit = 1;
 TMR0IP_bit = 1;
 GIE_bit = 1;
 
 TMR0L = 0xF0;
 TMR0H = 0xD8;

 T0CON = 0b10001000;

 while(1){}
}