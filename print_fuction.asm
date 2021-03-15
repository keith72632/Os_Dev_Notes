[org 0x7c00]

mov al, 'H'
call print
mov al, 'E'
call print
mov al, 'R'
call print

jmp $

print:
	pusha
	mov ah, 0x0e
	int 0x10
	popa
	ret

times 510-($-$$) db 0

dw 0xaa55
