set /p filename= "File name: "
set /p port= "COM Port: "

mkdir %filename%
cd ./%filename%

avr-as -g -mmcu=atmega328p -o "%filename%.o" "..\%filename%.s"
avr-ld -o ".\%filename%.elf" "%filename%.o"
avr-objcopy -O ihex -R .eeprom "%filename%.elf" "%filename%.hex"

where avrdude.conf > tmpFile 
set /p avrpath= < tmpFile 
del tmpFile 

avrdude -C "%avrpath%" -p atmega328p -c arduino -P "%port%" -D -U flash:w:"%filename%.hex":i

pause