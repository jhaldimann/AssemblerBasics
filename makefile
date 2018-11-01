all: recursion

clean:
	rm -rf *.o

recursion: recursion.o
	ld -o recursion recursion.o

recursion.o: recursion.asm
	nasm -f elf64 -g -F dwarf recursion.asm
