section .data
	text db "hello, worlasdsadasdasdasdsdasdsadd!",10, 0 ; add \0

section .text
	global _start

_start:
	call _printText
	call _exit

_printText:
	mov rcx, 0
	call _strLen
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, rcx
	syscall 
	ret

_strLen:
	cmp [text+rcx], 0
	jz _return
	inc rcx
	call _strLen

_return:
	ret

_exit:
	mov rax, 60
	mov rdi, 0
	syscall 
