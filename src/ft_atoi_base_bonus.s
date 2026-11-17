section .text
	global ft_atoi_base
	global _check_base
	extern ft_strlen
	global _get_value


_check_base:
	mov rcx, rdi
	push rdi
	cmp byte[rcx], 0
	je .error
	jmp .loop
.next:
	inc rcx
	cmp byte[rcx], 0
	jz .end
	mov rdi, rcx
.loop:
	inc rdi
	cmp byte[rdi], 0
	je .next
	mov r8, [rcx]
	cmp byte[rdi], r8b
	je .error
	jmp .loop
.error:
	mov rax, -1
	pop rdi
	ret
.end:
	mov rax, 1
	pop rdi
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
	mov rcx, rax ; mov baelen in rcx
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
.end:
	mov rax, r8
	ret







; _get_value:
; 	push rdi ;save base
; 	mov dl, byte[rsi] ; get number (1 for first turn)
; 	mov r8, 0;
; .loop:
; 	; cmp byte[rdi], 0
; 	; je .error
; 	cmp dl, byte[rdi] ; chexk num et base
; 	je .end
; 	inc r8; increment counter of value
; 	inc rdi ;increment position in the base
; 	jmp .loop
; .error:
; 	mov rax, -1
; 	pop rdi
; 	ret
; .end:
; 	pop rdi
; 	add rax, r8
; 	ret

; ft_atoi_base:
; 	mov rdx, rdi
; 	mov rdi, rsi
; 	call _check_base
; 	cmp rax, 0
; 	jl .error_atoi
; 	call ft_strlen
; 	mov rcx, rax
; 	mov rax, 0
; .loop:
; 	mul rcx
; 	call _get_value
; 	cmp rax, 0
; 	jl .error_atoi
; 	cmp byte[rsi],0
; 	jz .end_atoi
; 	inc rsi
; 	jmp .loop
; .error_atoi:
; 	mov rax, -3
; .end_atoi:
; 	ret


