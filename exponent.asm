; Author: Julian Haldimann
; Date: 10/22/2018

section .data
	number dq 3
	exponent dq 5
section .bss

section .text
	global _start

_start:
	mov RAX,[number]
	mov RBX,[exponent]
	mov RCX,[number]
loop:
	mul RCX
	dec RBX
	jz End
	jmp loop

End:
	mov RAX,60
	mov RDI,0
	syscall
	
	
