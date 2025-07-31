ORG 0x7c00
BITS 16
 
start:
    mov ah, 0eh  ;bios routine for video output
    mov al, 'A'  ; for printing A
    mov bx, 0
    int 0x10  ; software interrupt

    jmp $

    times 510-($-$$) db 0 ; fills the code with 0 so that total size is 512 bytes since we are making a bootloader
    dw 0xAA55
