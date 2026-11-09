section .data
	text db "hello, world!",10
	text2 db "salut, monde!",10

section .text
	global _start

_start:
	mov rax, 43
	cmp rax, 42
	je _printText
	jne _printText2
	call _exit

_printText:
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 14
	syscall 
	call _exit

_printText2:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 14
	syscall 
	call _exit

_exit:
	mov rax, 60
	mov rdi, 0
	syscall