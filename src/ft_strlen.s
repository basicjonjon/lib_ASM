section .text
	global _ft_strelen

; section .data
; 	text db "test",10



; section .bss

_ft_strelen:
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
	ret
