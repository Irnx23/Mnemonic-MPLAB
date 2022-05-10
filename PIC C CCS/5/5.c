#include <3.h>
#fuses hs
#use delay(Clock=4M)
#byte trisb=0x86
#byte trisc=0x87
#byte portb=0x06
#byte portc=0x07

void main(){
trisc=0b00000000;
trisb=0b00000111;

portc=0;
portb=0;

int a,b,c,d,e,f,g,h,i,j;
int sum;
int X=10;
while(true){

output_low(Pin_b4); //Manda 0 por el RB4
delay_ms(X);
if(input(Pin_B0)==0){a=1;}
if(input(Pin_B1)==0){b=2;}
if(input(Pin_B2)==0){c=3;}

output_high(Pin_b4); // Manda 1 por el RB4
output_low(Pin_b5); //Manda 0 por el RB5
delay_ms(X);

if(input(Pin_B0)==0){d=4;}
if(input(Pin_B1)==0){e=5;}
if(input(Pin_B2)==0){f=6;}

output_high(Pin_b5); //Manda 1 por el RB5
output_low(Pin_b6); //Manda 0 por el RB6
delay_ms(X);

if(input(Pin_B0)==0){g=7;}
if(input(Pin_B1)==0){h=8;}
if(input(Pin_B2)==0){i=9;}

output_high(Pin_b6); // Manda 1 por el RB6
output_low(Pin_b7); // Manda 0 por el RB7
delay_ms(X);

if(input(Pin_B1)==0){j=0;}
output_high(Pin_b7); // Manda 1 por el RB7

sum=a+b+c+d+e+f+g+h+i+j;

   for(i=1;i<=sum;i++){
         portC=0x01;
         delay_ms(60);
         portC=0x02;
         delay_ms(60);
         portC=0x04;
         delay_ms(60);
         portC=0x08;
         delay_ms(60);
         }
         
 sum=0;a=0;b=0;c=0;d=0;e=0;f=0;g=0;h=0;i=0;j=0;
 // ^ Limpia las variables para que no se acumule las sumas
}
}
