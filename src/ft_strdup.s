section .text
	global ft_strdup
	extern ft_strlen
	extern malloc

ft_strdup:
	push rdi
	call ft_strlen
	mov rdi, rax
	call malloc
	pop rdi
	push rax
	cmp rax, 0
	jz .error
.loop:
	mov dl, [rdi]
	mov [rax], dl
	cmp dl, 0
	jz .end
	inc rdi
	inc rax
	jmp .loop
.error:
	mov rax, 0
	ret
.end:
	pop rax
	ret
