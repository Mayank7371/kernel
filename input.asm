org 100h

mov ah, 01h      ; INT 21h function to take input
int 21h          ; AL <- user input character

mov bl, al       ; Copy input character to BL (for later use)

; Now display the ASCII value in digits
; First convert it to decimal and split into digits

mov ax, 0
mov al, bl       ; AL = ASCII code (e.g., 'A' = 65)

call print_number

; Go to next line
mov ah, 0Eh
mov al, 13       ; Carriage return
int 10h
mov al, 10       ; Line feed
int 10h

ret

;-----------------------------
; Print AX in decimal
print_number:
    mov cx, 0
    mov bx, 10

.divide:
    xor dx, dx        ; Clear high byte before division
    div bx            ; AX / 10 -> AL = quotient, DL = remainder
    push dx           ; Save remainder (digit)
    inc cx            ; Count digits
    test ax, ax
    jnz .divide

.print_loop:
    pop dx
    add dl, '0'
    mov ah, 0Eh
    mov al, dl
    int 10h
    loop .print_loop
    ret
