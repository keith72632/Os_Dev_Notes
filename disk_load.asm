disk_load:
	mov ah, 0x02    ;set BIOS read sector function
	mov dl, 0		;read drive 0
	mov ch, 3		;select cylinder 3
	mov dh, 1		;select track on second side of floppy
	mov cl, 4		;select 4th sector on track
	mov al, 5		;read 5 sectors from start point
	
	;set addresss for BIOS to read sectors to
	mov bx, 0xa000
	mov es, bx
	mov bx, 0x1234
	;data will read to 0xa000 to 0x1234
	int 0x13         ;interrupt so BIOS can do work
	
	int 0x13	
	jc disk_error    ;jumps if carry flag is set
	ret	
disk_error:
	mov bx, msg
	call print_string
msg:
	db "error reading to disk", 0

	
