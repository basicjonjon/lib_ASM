%include "macro.s"
%include "const.s"

section .data
	digit db 0,10 ; reserve deux octet, le 0 vas contenir la valeur ascii du nombre et 10 est le \n pour l'affichage

section .bss


section .text
	global _start

_start:
	mov rax, 7
	add rax, 2
	call _printRAXDigit
	mov rax, 8
	mov rbx, 2
	mov rdx, 0
	div rbx
	call _printRAXDigit
	exit 0

_printRAXDigit:
	add rax, 48
	mov [digit], al
	mov rax, 1
	mov rdi, STDOUT
	mov rsi, digit
	mov rdx, 2 
	syscall
	ret