section .text
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jne .error
	jmp .end
.error:
	call __errno_location
	mov [rax], -1
.end:
	ret