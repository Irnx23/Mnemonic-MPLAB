#include <16f877a.h>
#fuses XT,NOWDT
#use delay(clock=4000000)
#byte TRISA=0x85
#byte portA=0x05
#byte portb=0x06 
#byte TRISB=0x86 

void main(void){
   TRISA=0xFF;//puerto D como entradas
   TRISb=0x00; //Puerto B como salidas
   portb=0x00; //Limpia el puerto B
   
   while(true){
   if (input(PIN_A0) == 0){
         output_high(PIN_b0);
         delay_ms(100);}
         output_low(pin_b0);
         
    if (input(pin_a1) ==0){
         output_high(pin_b1);
         delay_ms(100);
         output_Low(pin_b1);
         delay_ms(100);
         output_high(pin_b1);
         delay_ms(100);
         output_Low(pin_b1);
         delay_ms(100);
         }
         
      if (input(pin_a2) ==0){
         output_high(pin_b2);
         delay_ms(100);
         output_Low(pin_b2);
         delay_ms(100);
         output_high(pin_b2);
         delay_ms(100);
         output_Low(pin_b2);
         delay_ms(100);
         output_high(pin_b2);
         delay_ms(100);
         output_Low(pin_b2);
         delay_ms(100);
         }
         
      if (input(pin_a3) ==0){
         output_high(pin_b3);
         delay_ms(100);
         output_Low(pin_b3);
         delay_ms(100);
         output_high(pin_b3);
         delay_ms(100);
         output_Low(pin_b3);
         delay_ms(100);
         output_high(pin_b3);
         delay_ms(100);
         output_Low(pin_b3);
         delay_ms(100);
         output_high(pin_b3);
         delay_ms(100);
         output_Low(pin_b3);
         delay_ms(100);
         }
         
  // else{
    //     output_high(pin_d4);
   }
}



