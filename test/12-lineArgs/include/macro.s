%macro exit 1
	mov rax, 60
	mov rdi, %1
	syscall
%endmacro



%macro divide 1
	push rbx
	mov rdx, 0
	mov rbx, %1
	div rbx
	pop rbx
%endmacro

%macro putNbr 1
	mov rax, %1
	push rbp
	mov rbp, rsp
%%putNbrLoop:
	divide 10
	add rdx, 48
	push rdx
	cmp rax, 0
	jz %%print
	jmp %%putNbrLoop
%%print:
	cmp rsp, rbp
	je %%end
	mov rax, 1
	mov rdi, STDOUT
	mov rsi, rsp
	mov rdx, 1
	syscall
	pop rdx
	jmp %%print
%%end:
	pop rbp
%endmacro

