

all: firstApp.elf
 
firstApp.elf: main.o LED/LED.o
	avr-gcc -I LED/ -o firstApp.elf main.o LED/LED.o
	
main.o: main.c
	avr-gcc -mmcu=atmega32 -Os -I LED/ -c main.c -o main.o
	
LED/LED.o: LED/LED.c
	avr-gcc -mmcu=atmega32 -Os -I LED/ -c LED/LED.c -o LED/LED.o
	


clean:
	rm -f main.o
	rm -f LED/LED.o
	rm -f firstApp.elf