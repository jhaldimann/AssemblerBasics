; Author: Julian Haldimann
; Date: 10/29/2018
SECTION .bss			; Section containing uninitialized data

	BUFFLEN	equ 16		; We read the file 16 bytes at a time
	Buff: 	resb BUFFLEN	; Text buffer itself
	
SECTION .data
		
SECTION .text			; Section containing code

global 	_start			; Linker needs this to find the entry point!
	
_start:
	nop			; This no-op keeps gdb happy...
Read:	
	mov eax,3		; Specify sys_read call
	mov ebx,0		; Specify File Descriptor 0: Standard Input
	mov ecx,Buff		; Pass offset of the buffer to read to
	mov edx,BUFFLEN		; Pass number of bytes to read at one pass
	int 80h			; Call sys_read to fill the buffer
	mov ebp,eax		; Save # of bytes read from file for later
	cmp eax,0		; If eax=0, sys_read reached EOF on stdin
	je Done			; Jump If Equal (to 0, from compare)

	mov esi,Buff		; Place address of file buffer into esi
	xor ecx,ecx		; Clear line string pointer to 0
	mov eax,ebp
	sub eax,1	
Loop:				; Loop over all numbers characters in 
	mov ebx,Buff		; Save EBX in Buff
	mov dl, byte [ebx+ecx]	; Copy two bytes into dl
	cmp dl, 5Ah		; Is my char smaller than 5Ah
	ja Continue		; Call continue if char is above
	cmp dl, 41h		; Is my char higher than 41h
	jb Continue		; Call continue if char is below
	add byte [ebx+ecx],20h	; Add 32 to the char to get uppercase

Continue:
	inc ecx			; Countup ecx by 1
	cmp ecx, eax 		; Compare ecx with eax
	jne Loop		; Jump if not equal
	
	mov eax,4		; Specify sys_write call
	mov ebx,1		; Specify File Descriptor 1: Standard output
	mov ecx,Buff		; Pass offset of line string
	mov edx,ebp		; Pass size of the line string
	int 80h			; Make kernel call to display line string
	jmp Read		; Loop back and load file buffer again
	
Done:
	mov eax,1		; Code for Exit Syscall
	mov ebx,0		; Return a code of zero	
	int 80H			; Make kernel call
