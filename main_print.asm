[org 0x7c00]

mov bx, msg
call print_string
jmp $

%include "print_string.asm"

msg:
	dw 'hello world', 0

times 510-($-$$) db 0
dw 0xaa55
