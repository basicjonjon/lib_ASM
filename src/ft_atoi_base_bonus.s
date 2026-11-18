section .text
	global ft_atoi_base
	global _check_base
	extern ft_strlen
	global _get_value
	global _is_whitespace
	global _is_invalide_char
	global _check_char

_check_base:
	test rdi, rdi
	jz .error
	cmp byte[rdi], 0
	je .error
	cmp byte[rdi + 1], 0
	jz .error
	mov r8, rdi
.next:
	push rdi
	movzx edi, byte[r8]
	call _check_char
	pop rdi
	cmp rax, 0
	jl .error
	mov rax, 0
	mov r9b, byte[r8]
	test r9b, r9b
	jz .end
	inc r8
.loop:
	cmp byte[r8 + rax], 0
	je .next
	cmp byte[r8 + rax], r9b
	je .error
	inc rax
	jmp .loop
.error:
	mov rax, -1
	ret
.end:
	mov rax, 0
	ret


_check_char:
	cmp rdi, '+'
	je .error
	cmp rdi, '-'
	je .error
	cmp rdi, ' '
	je .error
	cmp rdi, 9
	jl .ok
	cmp rdi, 13
	jl .error
	jmp .ok
.error:
	mov rax, -1
	ret
.ok:
	mov rax, 0
	ret

_get_value:
	mov rax, 0
.loop:
	cmp byte[rsi + rax], 0
	je .error
	cmp dil, byte[rsi + rax]
	je .end
	inc rax
	jmp .loop
.error:
	mov rax, -1
.end:
	ret


ft_atoi_base:
	mov rdx, rdi ; num dans rdx
	mov rdi, rsi ; base dans rdi
	call _check_base
	cmp rax, 0
	jl .error
	call ft_strlen
	cmp rax, 2
	jl .error
	mov rcx, rax ; mov baselen in rcx
.init:
	mov r9, rdx ;num dans r9
	mov rsi, rdi; base dans rsi 
	mov r8, 0 ; res
.loop:
	mov rax, r8
	mul rcx
	mov r8, rax
	mov dil, byte[r9]
	call _get_value
	add r8, rax
	inc r9
	cmp [r9], 0
	je .end
	jmp .loop
.error:
	mov rax, -1
	ret
.end:
	mov rax, r8
	ret


