section .text
	global ft_strlen

ft_strlen:
	push rdx
	mov rax, rdi
	mov rdx, 0
.loop:
	cmp [rax], 0
	jz .end
	inc rdx
	inc rax
	jmp .loop
.end:
	mov rax, rdx
	pop rdx
	ret
