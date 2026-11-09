section .data
	digit db 0,10 ; reserve deux octet, le 0 vas contenir la valeur ascii du nombre et 10 est le \n pour l'affichage

section .bss


section .text
	global _start

_start:
	push 1
	push 2
	push 3
	push 4
	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit
	call _exit

_printRAXDigit:
	add rax, 48
	mov [digit], al 
	mov rax, 1
	mov rdi, 1
	mov rsi, digit
	mov rdx, 2
	syscall
	ret

_exit:
	mov rax, 60
	mov rdi, 0
	syscall
