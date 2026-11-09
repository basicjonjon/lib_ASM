section .data
	digit db 0,10 ; reserve deux octet, le 0 vas contenir la valeur ascii du nombre et 10 est le \n pour l'affichage

section .bss


section .text
	global _start

_start:
	mov rax, 7
	call _printRAXDigit
	call _exit

_printRAXDigit:
	add rax, 48 ; ajout de la valeur ascii '0' a rax
	; move al (les 8 byte faible de RAX, AX = 16 byte de RAX, AL = 8 byte de AX) (AL = RAX + '0')dans le premier octet de digit 
	; donc le premier octet de digit est mainteant egale a AL ce qui permet d'enregistrer la valeur et de pouvoir reutiliser RAX
	mov [digit], al 
	; print digit
	mov rax, 1
	mov rdi, 1
	mov rsi, digit
	mov rdx, 2 ; ici print 2 octet car [digit] = AL (la valeur de rax + '0'), et [digit + 1] = 10, soit le \n
	syscall
	ret

_exit:
	mov rax, 60
	mov rdi, 0
	syscall
