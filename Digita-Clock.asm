
_update_time:

;Digita-Clock.c,48 :: 		void update_time(){
;Digita-Clock.c,51 :: 		second++;
	INCF       _second+0, 1
	BTFSC      STATUS+0, 2
	INCF       _second+1, 1
;Digita-Clock.c,52 :: 		if (second >= 60){
	MOVLW      128
	XORWF      _second+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__update_time58
	MOVLW      60
	SUBWF      _second+0, 0
L__update_time58:
	BTFSS      STATUS+0, 0
	GOTO       L_update_time0
;Digita-Clock.c,53 :: 		minute++;
	INCF       _minute+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minute+1, 1
;Digita-Clock.c,54 :: 		second = 0;
	CLRF       _second+0
	CLRF       _second+1
;Digita-Clock.c,55 :: 		}
L_update_time0:
;Digita-Clock.c,56 :: 		if (minute >= 60){
	MOVLW      128
	XORWF      _minute+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__update_time59
	MOVLW      60
	SUBWF      _minute+0, 0
L__update_time59:
	BTFSS      STATUS+0, 0
	GOTO       L_update_time1
;Digita-Clock.c,57 :: 		hour++;
	INCF       _hour+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hour+1, 1
;Digita-Clock.c,58 :: 		minute = 0;
	CLRF       _minute+0
	CLRF       _minute+1
;Digita-Clock.c,59 :: 		}
L_update_time1:
;Digita-Clock.c,60 :: 		if (hour >= 24){
	MOVLW      128
	XORWF      _hour+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__update_time60
	MOVLW      24
	SUBWF      _hour+0, 0
L__update_time60:
	BTFSS      STATUS+0, 0
	GOTO       L_update_time2
;Digita-Clock.c,61 :: 		day++;
	INCF       _day+0, 1
	BTFSC      STATUS+0, 2
	INCF       _day+1, 1
;Digita-Clock.c,62 :: 		hour = 0;
	CLRF       _hour+0
	CLRF       _hour+1
;Digita-Clock.c,63 :: 		}
L_update_time2:
;Digita-Clock.c,64 :: 		if (day >= 31){
	MOVLW      128
	XORWF      _day+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__update_time61
	MOVLW      31
	SUBWF      _day+0, 0
L__update_time61:
	BTFSS      STATUS+0, 0
	GOTO       L_update_time3
;Digita-Clock.c,65 :: 		month++;
	INCF       _month+0, 1
	BTFSC      STATUS+0, 2
	INCF       _month+1, 1
;Digita-Clock.c,66 :: 		day = 0;
	CLRF       _day+0
	CLRF       _day+1
;Digita-Clock.c,67 :: 		}
L_update_time3:
;Digita-Clock.c,68 :: 		if (month >= 13){
	MOVLW      128
	XORWF      _month+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__update_time62
	MOVLW      13
	SUBWF      _month+0, 0
L__update_time62:
	BTFSS      STATUS+0, 0
	GOTO       L_update_time4
;Digita-Clock.c,69 :: 		year++;
	INCF       _year+0, 1
	BTFSC      STATUS+0, 2
	INCF       _year+1, 1
;Digita-Clock.c,70 :: 		day = 0;
	CLRF       _day+0
	CLRF       _day+1
;Digita-Clock.c,71 :: 		}
L_update_time4:
;Digita-Clock.c,72 :: 		}
L_end_update_time:
	RETURN
; end of _update_time

_get_time:

;Digita-Clock.c,74 :: 		void get_time(){
;Digita-Clock.c,75 :: 		update_time();
	CALL       _update_time+0
;Digita-Clock.c,76 :: 		Delay_ms(50);   // To Adject 1S time
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_get_time5:
	DECFSZ     R13+0, 1
	GOTO       L_get_time5
	DECFSZ     R12+0, 1
	GOTO       L_get_time5
	NOP
;Digita-Clock.c,78 :: 		IntToStr(hour, hourC);
	MOVF       _hour+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _hour+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _hourC+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Digita-Clock.c,79 :: 		time[0] = hourC[4];
	MOVF       _hourC+4, 0
	MOVWF      _time+0
;Digita-Clock.c,80 :: 		time[1] = hourC[5];
	MOVF       _hourC+5, 0
	MOVWF      _time+1
;Digita-Clock.c,81 :: 		IntToStr(minute, minuteC);
	MOVF       _minute+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _minute+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _minuteC+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Digita-Clock.c,82 :: 		time[4] = minuteC[4];
	MOVF       _minuteC+4, 0
	MOVWF      _time+4
;Digita-Clock.c,83 :: 		time[5] = minuteC[5];
	MOVF       _minuteC+5, 0
	MOVWF      _time+5
;Digita-Clock.c,84 :: 		IntToStr(second, secondC);
	MOVF       _second+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _second+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _secondC+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Digita-Clock.c,85 :: 		time[8] = secondC[4];
	MOVF       _secondC+4, 0
	MOVWF      _time+8
;Digita-Clock.c,86 :: 		time[9] = secondC[5];
	MOVF       _secondC+5, 0
	MOVWF      _time+9
;Digita-Clock.c,88 :: 		IntToStr(day, dayC);
	MOVF       _day+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _day+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _dayC+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Digita-Clock.c,89 :: 		date[0] = dayC[4];
	MOVF       _dayC+4, 0
	MOVWF      _date+0
;Digita-Clock.c,90 :: 		date[1] = dayC[5];
	MOVF       _dayC+5, 0
	MOVWF      _date+1
;Digita-Clock.c,91 :: 		IntToStr(month, monthC);
	MOVF       _month+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _month+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _monthC+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Digita-Clock.c,92 :: 		date[4] = monthC[4];
	MOVF       _monthC+4, 0
	MOVWF      _date+4
;Digita-Clock.c,93 :: 		date[5] = monthC[5];
	MOVF       _monthC+5, 0
	MOVWF      _date+5
;Digita-Clock.c,94 :: 		IntToStr(year, yearC);
	MOVF       _year+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _year+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _yearC+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Digita-Clock.c,95 :: 		date[8] = yearC[4];
	MOVF       _yearC+4, 0
	MOVWF      _date+8
;Digita-Clock.c,96 :: 		date[9] = yearC[5];
	MOVF       _yearC+5, 0
	MOVWF      _date+9
;Digita-Clock.c,97 :: 		}
L_end_get_time:
	RETURN
; end of _get_time

_main:

;Digita-Clock.c,99 :: 		void main(){
;Digita-Clock.c,100 :: 		TRISA = 0x0F;//RA0 input
	MOVLW      15
	MOVWF      TRISA+0
;Digita-Clock.c,101 :: 		TRISB = 0x00;//all output
	CLRF       TRISB+0
;Digita-Clock.c,102 :: 		TRISC = 0xFF;//all input
	MOVLW      255
	MOVWF      TRISC+0
;Digita-Clock.c,103 :: 		ADCON1= 0x07;//all digital
	MOVLW      7
	MOVWF      ADCON1+0
;Digita-Clock.c,104 :: 		ADCON0= 0x00;//ADC OFF
	CLRF       ADCON0+0
;Digita-Clock.c,106 :: 		Lcd_Init();                // Initialize LCD
	CALL       _Lcd_Init+0
;Digita-Clock.c,107 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digita-Clock.c,108 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digita-Clock.c,110 :: 		while(1){
L_main6:
;Digita-Clock.c,111 :: 		if(!menu_button && old_state1){
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main10
	BTFSS      _old_state1+0, BitPos(_old_state1+0)
	GOTO       L_main10
L__main56:
;Digita-Clock.c,112 :: 		old_state1=0;
	BCF        _old_state1+0, BitPos(_old_state1+0)
;Digita-Clock.c,113 :: 		if(set_count<6)set_count++;
	MOVLW      6
	SUBWF      _set_count+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main11
	INCF       _set_count+0, 1
	GOTO       L_main12
L_main11:
;Digita-Clock.c,114 :: 		else set_count = 1;
	MOVLW      1
	MOVWF      _set_count+0
L_main12:
;Digita-Clock.c,115 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digita-Clock.c,116 :: 		mode = 1;
	MOVLW      1
	MOVWF      _mode+0
;Digita-Clock.c,117 :: 		}
L_main10:
;Digita-Clock.c,118 :: 		if(menu_button && !old_state1) old_state1 = 1;
	BTFSS      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main15
	BTFSC      _old_state1+0, BitPos(_old_state1+0)
	GOTO       L_main15
L__main55:
	BSF        _old_state1+0, BitPos(_old_state1+0)
L_main15:
;Digita-Clock.c,119 :: 		if(!back_button){
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main16
;Digita-Clock.c,120 :: 		mode = 0;
	CLRF       _mode+0
;Digita-Clock.c,121 :: 		set_count = 0;
	CLRF       _set_count+0
;Digita-Clock.c,122 :: 		}
L_main16:
;Digita-Clock.c,123 :: 		if(mode){
	MOVF       _mode+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
;Digita-Clock.c,124 :: 		Lcd_Out(1,1,"EDIT");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,125 :: 		Lcd_Out(2,1,"CLOCK");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,126 :: 		get_time();
	CALL       _get_time+0
;Digita-Clock.c,127 :: 		Lcd_Out(1,7, time);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,128 :: 		Lcd_Out(2,7, date);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _date+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,129 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
	NOP
;Digita-Clock.c,130 :: 		}
	GOTO       L_main19
L_main17:
;Digita-Clock.c,132 :: 		get_time();
	CALL       _get_time+0
;Digita-Clock.c,133 :: 		Lcd_Out(1,1,"Time: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,134 :: 		Lcd_Out(2,1,"Date: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,135 :: 		Lcd_Out(1,7, time);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,136 :: 		Lcd_Out(2,7, date);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _date+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,137 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
	NOP
;Digita-Clock.c,138 :: 		}
L_main19:
;Digita-Clock.c,139 :: 		if(set_count){
	MOVF       _set_count+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
;Digita-Clock.c,140 :: 		switch(set_count){
	GOTO       L_main22
;Digita-Clock.c,141 :: 		case 1:
L_main24:
;Digita-Clock.c,142 :: 		if(!plus_button)hour = hour + 1;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main25
	INCF       _hour+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hour+1, 1
L_main25:
;Digita-Clock.c,143 :: 		if(!minus_button)hour = hour - 1;
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main26
	MOVLW      1
	SUBWF      _hour+0, 1
	BTFSS      STATUS+0, 0
	DECF       _hour+1, 1
L_main26:
;Digita-Clock.c,144 :: 		if(hour>= 24)
	MOVLW      128
	XORWF      _hour+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      24
	SUBWF      _hour+0, 0
L__main65:
	BTFSS      STATUS+0, 0
	GOTO       L_main27
;Digita-Clock.c,145 :: 		hour = 0;
	CLRF       _hour+0
	CLRF       _hour+1
L_main27:
;Digita-Clock.c,146 :: 		Lcd_Out(1,7,"  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,147 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	NOP
	NOP
;Digita-Clock.c,148 :: 		break;
	GOTO       L_main23
;Digita-Clock.c,149 :: 		case 2:
L_main29:
;Digita-Clock.c,150 :: 		if(!plus_button)minute+=1;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main30
	INCF       _minute+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minute+1, 1
L_main30:
;Digita-Clock.c,151 :: 		if(!minus_button)minute -= 1;
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main31
	MOVLW      1
	SUBWF      _minute+0, 1
	BTFSS      STATUS+0, 0
	DECF       _minute+1, 1
L_main31:
;Digita-Clock.c,152 :: 		if(minute >= 60)
	MOVLW      128
	XORWF      _minute+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      60
	SUBWF      _minute+0, 0
L__main66:
	BTFSS      STATUS+0, 0
	GOTO       L_main32
;Digita-Clock.c,153 :: 		minute = 0;
	CLRF       _minute+0
	CLRF       _minute+1
L_main32:
;Digita-Clock.c,154 :: 		if(minute < 0)
	MOVLW      128
	XORWF      _minute+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      0
	SUBWF      _minute+0, 0
L__main67:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;Digita-Clock.c,155 :: 		minute = 59;
	MOVLW      59
	MOVWF      _minute+0
	MOVLW      0
	MOVWF      _minute+1
L_main33:
;Digita-Clock.c,156 :: 		Lcd_Out(1,11,"  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,157 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	NOP
	NOP
;Digita-Clock.c,158 :: 		break;
	GOTO       L_main23
;Digita-Clock.c,159 :: 		case 3:
L_main35:
;Digita-Clock.c,160 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	NOP
	NOP
;Digita-Clock.c,161 :: 		break;
	GOTO       L_main23
;Digita-Clock.c,162 :: 		case 4:
L_main37:
;Digita-Clock.c,163 :: 		if(!plus_button)day = day + 1;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main38
	INCF       _day+0, 1
	BTFSC      STATUS+0, 2
	INCF       _day+1, 1
L_main38:
;Digita-Clock.c,164 :: 		if(!minus_button)day = day - 1;
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main39
	MOVLW      1
	SUBWF      _day+0, 1
	BTFSS      STATUS+0, 0
	DECF       _day+1, 1
L_main39:
;Digita-Clock.c,165 :: 		if(day >= 32)
	MOVLW      128
	XORWF      _day+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      32
	SUBWF      _day+0, 0
L__main68:
	BTFSS      STATUS+0, 0
	GOTO       L_main40
;Digita-Clock.c,166 :: 		day = 1;
	MOVLW      1
	MOVWF      _day+0
	MOVLW      0
	MOVWF      _day+1
L_main40:
;Digita-Clock.c,167 :: 		if(day < 0)
	MOVLW      128
	XORWF      _day+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      0
	SUBWF      _day+0, 0
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L_main41
;Digita-Clock.c,168 :: 		day = 31;
	MOVLW      31
	MOVWF      _day+0
	MOVLW      0
	MOVWF      _day+1
L_main41:
;Digita-Clock.c,169 :: 		Lcd_Out(2,7,"  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,170 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	NOP
	NOP
;Digita-Clock.c,171 :: 		break;
	GOTO       L_main23
;Digita-Clock.c,172 :: 		case 5:
L_main43:
;Digita-Clock.c,173 :: 		if(!plus_button)month = month + 1;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main44
	INCF       _month+0, 1
	BTFSC      STATUS+0, 2
	INCF       _month+1, 1
L_main44:
;Digita-Clock.c,174 :: 		if(!minus_button)month = month - 1;
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main45
	MOVLW      1
	SUBWF      _month+0, 1
	BTFSS      STATUS+0, 0
	DECF       _month+1, 1
L_main45:
;Digita-Clock.c,175 :: 		if(month >= 13)
	MOVLW      128
	XORWF      _month+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      13
	SUBWF      _month+0, 0
L__main70:
	BTFSS      STATUS+0, 0
	GOTO       L_main46
;Digita-Clock.c,176 :: 		month = 1;
	MOVLW      1
	MOVWF      _month+0
	MOVLW      0
	MOVWF      _month+1
L_main46:
;Digita-Clock.c,177 :: 		if(month < 0)
	MOVLW      128
	XORWF      _month+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      0
	SUBWF      _month+0, 0
L__main71:
	BTFSC      STATUS+0, 0
	GOTO       L_main47
;Digita-Clock.c,178 :: 		month = 12;
	MOVLW      12
	MOVWF      _month+0
	MOVLW      0
	MOVWF      _month+1
L_main47:
;Digita-Clock.c,179 :: 		Lcd_Out(2,11,"  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,180 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	NOP
	NOP
;Digita-Clock.c,181 :: 		break;
	GOTO       L_main23
;Digita-Clock.c,182 :: 		case 6:
L_main49:
;Digita-Clock.c,183 :: 		if(!plus_button)year = year + 1;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main50
	INCF       _year+0, 1
	BTFSC      STATUS+0, 2
	INCF       _year+1, 1
L_main50:
;Digita-Clock.c,184 :: 		if(!minus_button)year = year - 1;
	BTFSC      RA3_bit+0, BitPos(RA3_bit+0)
	GOTO       L_main51
	MOVLW      1
	SUBWF      _year+0, 1
	BTFSS      STATUS+0, 0
	DECF       _year+1, 1
L_main51:
;Digita-Clock.c,185 :: 		if(year <= -1)
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      _year+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVF       _year+0, 0
	SUBLW      255
L__main72:
	BTFSS      STATUS+0, 0
	GOTO       L_main52
;Digita-Clock.c,186 :: 		year = 99;
	MOVLW      99
	MOVWF      _year+0
	MOVLW      0
	MOVWF      _year+1
L_main52:
;Digita-Clock.c,187 :: 		if(year > 50)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _year+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVF       _year+0, 0
	SUBLW      50
L__main73:
	BTFSC      STATUS+0, 0
	GOTO       L_main53
;Digita-Clock.c,188 :: 		year = 0;
	CLRF       _year+0
	CLRF       _year+1
L_main53:
;Digita-Clock.c,189 :: 		Lcd_Out(2,15,"  ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Digita-Clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digita-Clock.c,190 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	NOP
	NOP
;Digita-Clock.c,191 :: 		break;
	GOTO       L_main23
;Digita-Clock.c,194 :: 		}
L_main22:
	MOVF       _set_count+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _set_count+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main29
	MOVF       _set_count+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _set_count+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _set_count+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main43
	MOVF       _set_count+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main49
L_main23:
;Digita-Clock.c,195 :: 		}
L_main21:
;Digita-Clock.c,196 :: 		}
	GOTO       L_main6
;Digita-Clock.c,197 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
