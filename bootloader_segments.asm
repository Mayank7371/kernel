[BITS 16]
[ORG 0x0000]

start:
    cli
    cld

    mov ax, 0x7C0
    mov ds, ax
    mov es, ax

    xor ax, ax
    mov ss, ax
    mov sp, 0x7C00

    jmp 0x07C0:start2

start2:
    mov si, message
    call print

    jmp $

print:
    mov ah, 0x0E
.loop:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .loop
.done:
    ret

message db "Hello, world!", 0

times 510 - ($ - $$) db 0
dw 0xAA55
