org 100h

mov cx, 10        ; Loop 10 times (for numbers 0 to 9)
mov bl, 0         ; Start from 0

print_loop:
    mov al, bl
    add al, '0'   ; Convert number to ASCII

    mov ah, 0Eh
    int 10h       ; Print the digit

    call delay    ; Slow it down so it looks cool

    inc bl        ; Next number
    loop print_loop

ret

; ----------------------------------
; Delay subroutine: Just burns time
delay:
    mov cx, 0FFFFh
wait1:
    nop
    loop wait1
    ret
