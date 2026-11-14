section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rsi
.loop:
	mov dl, [rsi]
	mov [rdi], dl
	cmp [rdi], 0
	jz .end
	inc rsi
	inc rdi
	jnz ft_strcpy
.end:
	ret
