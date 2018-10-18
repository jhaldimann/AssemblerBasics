; Exectuable name : exercise2
; Version : 1.0
; Created at : 10/18/2018
; Last update : 10/18/2018
; Author: Julian Haldimann

section .data
	EatMsg : db "Hello World",10
	EatLng : equ $-EatMsg

section .bss

section .text

global _start

_start:
	nop
	mov rax,1 	; Move 1 into rax
	mov rdi,1 	; Move 1 into rdi
	mov rsi,EatMsg 	; Move content of the sting into rsi
	mov rdx,EatLng 	; Move length of the string into rdx
	mov r10,EatMsg 	; Move content of the string into r10
	syscall 	; make kernel call

	mov rax,60	; Exit code
	mov rdi,0	; Return a code of zero
	syscall		; Make a kernel call
