all: exercise5

clean:
	rm -rf *.o

exercise5: exercise5.o
	ld -o exercise5 exercise5.o

exercise5.o: exercise5.asm
	nasm -f elf64 -g -F dwarf exercise5.asm
