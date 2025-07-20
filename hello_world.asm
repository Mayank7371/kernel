org 100h          ; Start at offset 100h (standard for COM programs)

jmp main          ; Jump to main program

message: db 'Hello World!', 0   ; Message string with null terminator

; --------------------------
; Subroutine to print string
; --------------------------
print:
    mov ah, 0Eh          ; Set teletype video function

._loop:
    lodsb                ; Load byte from SI into AL, then increment SI
    cmp al, 0            ; Check for null terminator
    je .done             ; If 0, jump to done
    int 10h              ; BIOS interrupt to print character
    jmp ._loop           ; Repeat for next character

.done:
    ret                  ; Return to caller

; --------------------------
; Main Program
; --------------------------
main:
    mov si, message      ; Point SI to start of message
    call print           ; Call print routine

ret                      ; End program
