%include "macro.s"
%include "const.s"

section .data
	digit db 0,10 ; reserve deux octet, le 0 vas contenir la valeur ascii du nombre et 10 est le \n pour l'affichage

section .bss


section .text
	global _start

_start:
	
	exit 0


_putNbr:
	mov rdx 0
_putNbrLoop:
	cmp rax, 10
	div 10
	push rbx
	jg _putNbr



_printRAXDigit:
	add rax, 48
	mov [digit], al
	mov rax, 1
	mov rdi, STDOUT
	mov rsi, digit
	mov rdx, 2 
	syscall
	ret