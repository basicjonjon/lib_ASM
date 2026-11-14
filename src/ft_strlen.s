section .text
	global ft_strlen

ft_strlen:
	push rcx
	mov rax, rdi
	mov rcx, 0
.loop:
	cmp [rax], 0
	jz .end
	inc rcx
	inc rax
	jmp .loop
.end:
	mov rax, rcx
	pop rcx
	ret
