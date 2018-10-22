; Author: Julian Haldimann
; Date: 10/22/2018

section .data
	myNumber dd 35.0
section .bss
		
	
section .text
	global _start

_start:
	mov R15,[myNumber]
	call _exit

_exit: 
	mov RAX,60
	mov RDI,0
	syscall
	

