; Version	: 1.0
; Created at	: 10/18/2018
; Author	: Julian Haldimann

section .data
	Msg: db "Hello World",10
	MsgLen: equ $-Msg
	
section .bss

section .text
global _start

_start:
	nop
	mov rbx,5

loop:
	mov rax,1
	mov rdi,1
	mov rsi,Msg
	mov rdx,MsgLen
	syscall
	dec rbx
	jz End
	jmp loop
End:
	mov rax,60
	mov rdi,0
	syscall
