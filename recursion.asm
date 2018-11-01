; Author: Julian Haldimann
; Date: 10/30/2018

section .data
	input db "Insert factor here"
	textLng equ $-input
	output db "Output: "
section .bss
	factor resb 1
section .text
	global _start

_start:
	call _printFirstLine
	call _getInput
	mov rbx,rsi
	call _calculate

_printFirstLine:
	mov rax,1
	mov rdi,1
	mov rsi,input
	mov rdx,textLng
	syscall
	ret

_getInput:
	mov rax,0
	mov rdi,0
	mov rsi,factor
	mov rdx,16
	syscall
	ret

_calculate:
	mul rcx
	dec rbx
	jz End
	jmp _calculate

End: 
	mov rax,1
	mov rdi,1
	mov rsi,factor
	mov rdx,16
	syscall

	mov rax,60
	mov rdi,0
	syscall
