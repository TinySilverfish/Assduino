set /p filename= "File name: "
set /p port= "COM Port: "

cd ./

mkdir %filename%

move %filename%.s ./%filename%/

cd %filename%

avr-as -g -mmcu=atmega328p -o %filename%.o %filename%.s

avr-ld -o .\%filename%.elf %filename%.o

avr-objcopy -O ihex -R .eeprom %filename%.elf %filename%.hex

where avrdude > tmpFile 
set /p path= < tmpFile 
del tmpFile 

set path=%path:avrdude.exe=avrdude.conf%

avrdude -C %path% -p atmega328p -c arduino -P %port% -D -U flash:w:%filename%.hex:i

pause
