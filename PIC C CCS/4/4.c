//#include <2.h>
#include <16f877a.h>
#fuses XT,NOWDT
#use delay(clock=4000000)
#byte PortC=0x07
#byte portB=0x06 
#byte PortD=0x08
#byte TrisB=0x85
#byte TrisC=0x86
#byte TrisD=0x87

void main()
{
 int a,b,c,d;
 int i,sum,mitad;
 
   TrisC=0xFF; //Puerto C como entrada
   TrisB=0xFF; //Puerto B como entrada
   TrisD=0x00; //Puerto D como salida
   
   portb=0x00; //Limpia el puerto B
   portc=0x00; //Limpia el puerto C
   portd=0x00; //Limpia el puerto D

while(True){
         
    if(input(PIN_B0)==1){
      a=1;}
        if (input(PIN_B1)==1){
        b=2;}
            if (input(PIN_B2)==1){
           c=4;}
               if (input(PIN_B3)==1){
              d=8;}
 
   sum=a+b+c+d;
   mitad=sum/2;
 
   
  if(input(pin_D0)==1){
     for(i=1;i<=sum;i++){
         portC=0x01;
         delay_ms(60);
         portC=0x02;
         delay_ms(60);
         portC=0x04;
         delay_ms(60);
         portC=0x08;
         delay_ms(60);
   }}
   
   // '||' Simbolo para la compuerta OR
   if(input(pin_D1)==1){
       if ((sum==1)||(sum==3)||(sum==5)||(sum==7)||(sum==9) ||(sum==11)||(sum==13)||(sum==15)) {
           for(i=1;i<=mitad;i++){
               Portc=0x00;
               delay_ms(60);
               }
               }
               
               
       else{ 
            for(i=1;i<=mitad;i++){
             portC=0x08;
             delay_ms(60);
             portC=0x04;
             delay_ms(60);
             portC=0x02;
             delay_ms(60);
             portC=0x01;
             delay_ms(60);}
             }
             }
// Se limpian las variables.             
         a=0;
         b=0;
         c=0;
         d=0;
         sum=0;
         mitad=0;
         delay_ms(30);
             
}
}

