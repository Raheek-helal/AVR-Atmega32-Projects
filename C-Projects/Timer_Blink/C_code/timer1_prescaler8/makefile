MAKE := make
clean:
	rm -fd Blink.o
	rm -fd Blink.elf
	rm -fd Blink.hex
	
all: Blink.hex

Blink.hex: Blink.elf
	avr-objcopy -O ihex -R .eeprom Blink.elf Blink.hex

Blink.elf: Blink.o
	avr-gcc -mmcu=atmega32 -Os -o Blink.elf Blink.o
	
Blink.o: Blink.c
	avr-gcc -mmcu=atmega32 -Os -c Blink.c -o Blink.o