set /p filename= "File name: "

cd ./

avr-as -g -mmcu=atmega328p -o "%filename%.o" "%filename%.s"

avr-ld -o ".\%filename%.elf" "%filename%.o"

avr-objcopy -O ihex -R .eeprom "%filename%.elf" "%filename%.hex"



avrdude -C "C:\Program Files (x86)\bin\avrdude.conf" -p atmega328p -c arduino -P "COM7" -D -U flash:w:"%filename%.hex":i


pause
