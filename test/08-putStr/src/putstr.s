section .data
	text db "hello, worlasdsadasdasdasdsdasdsadd!",10, 0 ; add \0

section .text
	global _start

_start:
	mov rax, text
	call _print
	call _exit

_print:
	push rax ; enregistre la  valeur de rax dans la stack (rax contient l'adresse de la string)
	mov rbx, 0 ;init rbx a 0 pour le compteur
_printLoop:
	inc rax
	inc rbx
	; deplace la valeur pointer par l'adresse actuelle de rax dans cl
	; cl est le registre 8bits de rcx, cela permet donc de ne tester que le char pointer actuellement
	mov cl, [rax]
	cmp cl, 0
	jne _printLoop ; si cl n'est pas egale a 0, alor revenir au debut
	mov rax, 1 ; sys_write
	mov rdi, 1 ; stdout
	pop rsi ; pop la valeur de rax  enregistrer dans la stack (adresse de la string) dans rsi
	mov rdx, rbx ; mov la taille dans rdx
	syscall
	ret

_exit:
	mov rax, 60
	mov rdi, 0
	syscall 
