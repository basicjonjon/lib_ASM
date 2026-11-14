section .text
	global ft_strdup
	extern ft_strlen
	extern __errno_location
	extern malloc
	extern ft_write


ft_strdup:
	push rdi
	call ft_strlen
	add rax, 48
	mov rdi, rax
	call malloc
	push rax
	cmp rax, 0
	jz .error
	pop rdi
.loop:
	mov dl, [rdi]
	mov [rax], dl
	cmp dl, 0
	jz .end
	inc rdi
	inc rax
	jmp .loop
.error:
	pop rax
	call __errno_location
	mov [rax], 12
.end:
	pop rax
	ret
