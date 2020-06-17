sbit LED at RD0_bit;


void interrupt()
{
   switch(LED)
   {
    case 0:
    {
     TMR0L = 0x90;
     TMR0H = 0xE8;
     break;
    }
    case 1:
    {
     TMR0L = 0x50;
     TMR0H = 0xC9;
     break;
    }
   }
   LED = !LED;
   TMR0IF_bit = 0;
}

void main()
{
 TRISD.RD0 = 0;

 TMR0IF_bit = 0;
 TMR0IE_bit = 1;
 TMR0IP_bit = 1;
 GIE_bit = 1;

 LED = 1;
 TMR0L = 0x50;
 TMR0H = 0xC9;

 T0CON = 0b10001000;

 while(1){}
}
