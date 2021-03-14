[org 0x7c00]


mov ah, 0x0e

mov al, [secret_message]
int 0x10
mov al, [secret_message+1]
int 0x10
mov al, [secret_message+2]
int 0x10
mov al, [secret_message+3]
int 0x10
mov al, [secret_message+4]
int 0x10

jmp $

secret_message:
	db 'hello world', 0


times 510-($-$$) db 0

dw 0xaa55
