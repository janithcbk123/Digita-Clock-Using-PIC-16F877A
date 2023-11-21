# Digita-Clock-Using-PIC-16F877A
An alternative to the conventional analog clock is a digital clock. On a watch, phone, or alarm clock, this kind of clock uses digits to display the time in a digital format. Both a 12- and 24-hour format is possible.

<p align="left">
In this project, I attempt to put into practice a functional digital clock that shows the time in the format "hh:mm:ss" and the date in the format "yy:mm:dd." To implement the time, we employ the interrupt approach without using the Real Time Clock Module. I'll also aim to include four buttons that will let you change the number of hours and minutes.
</p>


## Features

-  LCD display to display the Time and Date in the following format
   - Time: Hour: Minutes (Collen blinks in with the frequency of 2 Hz)
   - Data: Day: Month: Year ()
- Ability to adjust Hours and Minutes using a button/buttons.


## Schematic Diagram 

<p align="center">
<img width="650" src="https://github.com/janithcbk123/Digita-Clock-Using-PIC-16F877A/blob/main/Supportive%20Images/Schematic%20Diagram.png?raw=true">
</p>


## Components List

|     Part          | Number of Components |
| ----------------- | -------------------- |
| PIC16F778A        |          1           |
| LM016L            |          1           |
| Variable resistor |          1           |
| Resistor 10K ohm  |          1           |
| Resistor 10 ohm   |          4           |
| Push switches     |          5           |
| Quartz crystal    |          1           |
| Capacitor 22pf    |          2           |


## Test Results

#### At the Beginning
<p align="center">
  <img width="650" src="https://github.com/janithcbk123/Digita-Clock-Using-PIC-16F877A/blob/main/Supportive%20Images/At%20the%20Beginning.png?raw=true">
</p>

### Some Time Later
<p align="center">
  <img width="350" src="https://github.com/janithcbk123/Digita-Clock-Using-PIC-16F877A/blob/main/Supportive%20Images/Some%20Time%20Later.png?raw=true">
</p>

### Edit Mode

<p align="center">
  <img width="250" src="https://github.com/janithcbk123/Digita-Clock-Using-PIC-16F877A/blob/main/Supportive%20Images/Edit%20Mode.png?raw=true">
</p>

### Running Mode

<p align="center">
  <img width="250" src="https://github.com/janithcbk123/Digita-Clock-Using-PIC-16F877A/blob/main/Supportive%20Images/Running%20Mode.png?raw=true">
</p>

### After Setting Current Time

<p align="center">
  <img width="250" src="https://github.com/janithcbk123/Digita-Clock-Using-PIC-16F877A/blob/main/Supportive%20Images/After%20Setting%20Current%20Time.png?raw=true">
</p>


## Conclusion

<p align="left">
  The digital clock has a little lag in regard to real clock time because the code is read line by line and introduces minute time delays that mount up as the program runs. This problem cannot be solved with the      technology that is available today. 
</p>

To improve the accuracy of this design we can RTC module. RTC module can’

1. Accurate timekeeping: RTC ensures that your computer maintains accurate time and date information, which is crucial for various applications, including scheduling, event tracking, and synchronization.
1. System updates: Many operating systems and software rely on accurate timekeeping to perform system updates and maintain security. RTC helps ensure that these updates occur at the correct time.
1. Timestamps: Many computer applications and processes rely on timestamps to keep track of when certain events occurred. RTC provides accurate timestamps, which are essential for troubleshooting, auditing, and forensic analysis.
   
<p align="left">
  Also, using a debouncing mechanism when making the real product is recommended to remove the bouncing of the switch 
</p>

<p align="left">
  A major disadvantage in this design is we always have to set time at the beginning. otherwise, it start from all zeros 
</p>


## Acknowledgements
I would like to acknowledge and give our thanks to Mr. Rukshan Darshana Wijesinghe and the EEE307 module team for supporting the project.

## Author
- [@janithcbk123](https://www.github.com/janithcbk123)
