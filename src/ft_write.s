section .text
	global ft_write
	extern __errno_location

ft_write:
	mov rax, 1
	syscall
	cmp rax, -1
	je .error
	jmp .end
.error:
	call __errno_location
	mov [rax], -1
.end:
	ret

