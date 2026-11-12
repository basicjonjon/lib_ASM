%include "macro.s"
%include "const.s"

section .data
	newline db 10,0
	text db "test",10, 0

section .text
	global _start

%macro printTxt 1
	strlen %1
	mov rdx, rax
	mov rsi, %1
	mov rax, 1
	mov rdi, 1
	syscall
%endmacro

_start:
	push r12
	mov r12, [rsp + 8]
	push r13
	putNbr r12
	mov rdx, 0
_argsPrintLoop:
	mov rdi,
	printTxt rdi
	inc rdx
	cmp rdx, r12
	jl _argsPrintLoop
	exit 0