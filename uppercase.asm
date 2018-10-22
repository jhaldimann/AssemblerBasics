; Author: Julian Haldimann
; Date: 10/22/2018

section .data
	text db "helloworld",0Ah
	textLen equ $-text
section .bss

section .text

global _start

_start:
	mov ECX,text
	mov EAX,10

_loop:
	sub byte[ECX],32
	inc ecx
	dec eax
	jnz _loop
	mov eax,4
	mov ebx,1
	mov ecx,text
	mov edx,textLen
	int 80h
	nop
	mov eax,1
	mov ebx,0
	int 80h
