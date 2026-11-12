%include "macro.s"
%include "const.s"

section .data
	digit db 0,10


section .text
	global _start



_start:
	putNbr 42
	exit 0