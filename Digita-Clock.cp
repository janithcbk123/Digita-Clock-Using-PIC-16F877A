
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

int second,minute,hour;
int hr,day,dday,month,year,ap,app;
unsigned short set_timer=0;
unsigned short mode=0;
unsigned short set_count = 0;
bit old_state1;

char secondC[7];
char minuteC[7];
char hourC[7];

char dayC[7];
char monthC[7];
char yearC[7];

char time[] = "00: 00: 00";
char date[] = "00: 00: 00";

void update_time(){


 second++;
 if (second >= 60){
 minute++;
 second = 0;
 }
 if (minute >= 60){
 hour++;
 minute = 0;
 }
 if (hour >= 24){
 day++;
 hour = 0;
 }
 if (day >= 31){
 month++;
 day = 0;
 }
 if (month >= 13){
 year++;
 day = 0;
 }
}

void get_time(){
 update_time();
 Delay_ms(50);

 IntToStr(hour, hourC);
 time[0] = hourC[4];
 time[1] = hourC[5];
 IntToStr(minute, minuteC);
 time[4] = minuteC[4];
 time[5] = minuteC[5];
 IntToStr(second, secondC);
 time[8] = secondC[4];
 time[9] = secondC[5];

 IntToStr(day, dayC);
 date[0] = dayC[4];
 date[1] = dayC[5];
 IntToStr(month, monthC);
 date[4] = monthC[4];
 date[5] = monthC[5];
 IntToStr(year, yearC);
 date[8] = yearC[4];
 date[9] = yearC[5];
}

void main(){
 TRISA = 0x0F;
 TRISB = 0x00;
 TRISC = 0xFF;
 ADCON1= 0x07;
 ADCON0= 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1){
 if(! RA0_bit  && old_state1){
 old_state1=0;
 if(set_count<6)set_count++;
 else set_count = 1;
 Lcd_Cmd(_LCD_CLEAR);
 mode = 1;
 }
 if( RA0_bit  && !old_state1) old_state1 = 1;
 if(! RA1_bit ){
 mode = 0;
 set_count = 0;
 }
 if(mode){
 Lcd_Out(1,1,"EDIT");
 Lcd_Out(2,1,"CLOCK");
 get_time();
 Lcd_Out(1,7, time);
 Lcd_Out(2,7, date);
 Delay_ms(100);
 }
 else{
 get_time();
 Lcd_Out(1,1,"Time: ");
 Lcd_Out(2,1,"Date: ");
 Lcd_Out(1,7, time);
 Lcd_Out(2,7, date);
 Delay_ms(100);
 }
 if(set_count){
 switch(set_count){
 case 1:
 if(! RA2_bit )hour = hour + 1;
 if(! RA3_bit )hour = hour - 1;
 if(hour>= 24)
 hour = 0;
 Lcd_Out(1,7,"  ");
 Delay_ms(100);
 break;
 case 2:
 if(! RA2_bit )minute+=1;
 if(! RA3_bit )minute -= 1;
 if(minute >= 60)
 minute = 0;
 if(minute < 0)
 minute = 59;
 Lcd_Out(1,11,"  ");
 Delay_ms(100);
 break;
 case 3:
 Delay_ms(100);
 break;
 case 4:
 if(! RA2_bit )day = day + 1;
 if(! RA3_bit )day = day - 1;
 if(day >= 32)
 day = 1;
 if(day < 0)
 day = 31;
 Lcd_Out(2,7,"  ");
 Delay_ms(100);
 break;
 case 5:
 if(! RA2_bit )month = month + 1;
 if(! RA3_bit )month = month - 1;
 if(month >= 13)
 month = 1;
 if(month < 0)
 month = 12;
 Lcd_Out(2,11,"  ");
 Delay_ms(100);
 break;
 case 6:
 if(! RA2_bit )year = year + 1;
 if(! RA3_bit )year = year - 1;
 if(year <= -1)
 year = 99;
 if(year > 50)
 year = 0;
 Lcd_Out(2,15,"  ");
 Delay_ms(100);
 break;


 }
 }
 }
}
