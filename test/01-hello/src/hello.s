; la section .data est l'endroit ou son defini toute les data avant la compilation
section .data
	; db signifie define bytes, sert a definire des donner
	; a insserer plus tard dans le code
	; le 10 = \n
	; text est le nom assigner a l'adresse ou est stocker la valeur
	text db "hello, world!",10

; il existe un section BSS qui permettra d'allouer de la memoir furture

; text est l'endroit ou on rend certaine partie du code accessible a l'exterieur du fichier 
section .text
	;ici global est utiliser pour que le linker connaisse l'adresse de start
	global _start

; RAX contient l'id du syscall
; RDI contient l'argument 1 du syscall (dans le cas de sys_write, le fd)
; RSI contient l'argument 2 du syscall (dans le cas de sys_write, le buffer)
; RDX contient l'argument 3 du syscall (dans le cas de sys_write, la taille du buffer)
; R10 contient l'argument 4 du syscall (dans le cas de sys_write, rien)
; R8  contient l'argument 5 du syscall (dans le cas de sys_write, rien)
; R9 contient l'argument 2 du syscall (dans le cas de sys_write, rien)

; _start est un label, un peu comme un nom de fonction ?
; le compilateur transformera ce nom en son adresse
; l'etiquette _start est obligatoire
; le code ne compilera pas si il n'est pas la 
_start:
	; rax rdi rsi rdx son des registre 64-bit
	; charge l'identifiant du syscall voulu dans le registre rax
	; l'id 1 correspond a sys_write
	; il y a 328 apelle systeme different
	; mov permet de deplacer la valeur, donc je deplace la valeur 1 dans rax
	mov rax, 1 
	; cet argument est le fd
	mov rdi, 1
	; cet argument est le buffer a envoyer
	; text, qui a ete definie haut
	mov rsi, text
	; cet argument est la taille du buffer
	mov rdx, 14
	syscall ; appel systeme, sert a demander un "service" au kernel

	; le syscall 60 est sys_exit, permet de dire au systeme que c'est la fin du code
	mov rax, 60
	; l'argument 1 de sys_exit est son code d'erreur, ici 0 car tout est bien fini
	mov rdi, 0
	syscall