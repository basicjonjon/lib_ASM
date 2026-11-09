section .data
	text db "hello, world!",10

section .text
	global _start

_start:
	call _printText
	call _exit

_printText:
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 14
	syscall ;DONT FORGET!!!!
	ret

_exit:
	mov rax, 60
	mov rdi, 0
	syscall ;DONT FORGET!!!!
