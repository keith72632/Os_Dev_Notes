[org 0x7c00]

mov ah, 0x0e
int 0x10

mov bx, 4
cmp bx, 10
jle label


label:
	mov al, 'A'
	int 0x10
	
jmp $

times 510-($-$$) db 0

dw 0xaa55
