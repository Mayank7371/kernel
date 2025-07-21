org 100h

mov si, msg1
call print_string

mov si, msg2
call print_string

mov si, msg3
call print_string

ret

; ---------- SUBROUTINE TO PRINT STRING ----------
print_string:
    mov ah, 0Eh     
.next_char:
    lodsb           
    cmp al, 0       
    je .done
    int 10h         
    jmp .next_char
.done:
    ret

; ---------- STRINGS ----------
msg1 db 'yo!', 13, 10, 0     ; 13,10 = new line
msg2 db '!!!!', 13, 10, 0
msg3 db 'hmm', 0
