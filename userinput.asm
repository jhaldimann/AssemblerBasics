; Author: Julian Haldimann
; Date: 10/19/2018

section .data
	input db "What is your name? "
	textLng equ $-input
	output db "Hello, "

section .bss
	name resb 16

section .text
	global _start

_start:	
	call _printFirstText
	call _getInput
	call _printSecondText

	mov rax,60	; finish programm
	mov rdi,0	; finish programm
	syscall		; make a system cal

_getInput:
	mov rax,0
	mov rdi,0
	mov rsi,name
	mov rdx,16
	syscall
	ret

_printFirstText:
	mov rax,1
	mov rdi,1
	mov rsi,input
	mov rdx, textLng
	syscall
	ret

_printSecondText:
	mov rax,1
	mov rdi,1
	mov rsi,output
	mov rdx,16
	syscall
	ret
