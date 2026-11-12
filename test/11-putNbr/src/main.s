%include "macro.s"
%include "const.s"

section .data
	digit db 0,10


section .text
	global _start

_start:
	mov rdi, 5
	call _putNbr
	exit 0

%macro divide 1
	push rbx
	mov rdx, 0
	mov rbx, %1
	div rbx
	pop rbx
%endmacro

_putNbr:
	mov rax, rdi
	push rbp
	mov rbp, rsp
_putNbrLoop:
	divide 10
	add rdx, 48
	push rdx
	cmp rax, 0
	jz _print
	jmp _putNbrLoop
_print:
	cmp rsp, rbp
	je _end
	mov rax, 1
	mov rdi, STDOUT
	mov rsi, rsp
	mov rdx, 1
	syscall
	pop rdx
	jmp _print
_end:
	pop rbp
	ret
