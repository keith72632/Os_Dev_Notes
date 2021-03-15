[org 0x7c00]

mov [BOOT_DRIVE], dl

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000         ;load 5 sectors to 0x0000(ES):0x9000(bx)
mov dh, 5			
mov dl, [BOOT_DRIVE]
call disk_load

mov bx, success
call print_string

mov dx, [0x9000]
call print_hex

mov dx, [0x9000+52]
call print_hex

jmp $

%include "print_string.asm"
%include "print_hex.asm"
%include "disk_load.asm"

BOOT_DRIVE: db 0
success: db "success loading disk", 0

times 510-($-$$) db 0
dw 0xaa55

;just to prove BIOS will only load first 512byte sectors
times 256 dw 0xdada
times 256 dw 0xface    

