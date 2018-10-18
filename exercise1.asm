;;; File exercise1.asm
;;; Author: Julian Haldimann
;;; Date: 10/18/2018


section .data

section .text
	global _start
_start:
	mov rax , 75
	mov rbx , -4
	mov rax , rsp
	mov r8 , rsp
	
	mov rax , 60
	mov rdi , 0
	syscall
