section .text
	global _ft_strelen

_ft_strelen:
	push rcx
	mov rax, rdi
	mov rcx, 0
_loop:
	cmp [rax], 0
	jz _end
	inc rcx
	inc rax
	jmp _loop
_end:
	mov rax, rcx
	pop rcx
	ret
