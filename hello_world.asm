org 100h          ; Set code starting point at memory offset 100h (COM program standard)

jmp main          ; Jump to main (skip data section for now)

; -------------------------------
; DATA SECTION
; -------------------------------
message: db 'Hello World!', 0  ; Define string with null terminator

; -------------------------------
; PROCEDURE TO PRINT STRING
; -------------------------------
print_char:
    mov si, message     ; Load address of message into SI
    mov ah, 0Eh         ; BIOS teletype print function

._loop:
    lodsb               ; Load byte from [SI] into AL, increment SI
    cmp al, 0           ; Check if it's null terminator
    je .done            ; If yes, jump to done

    int 10h             ; BIOS interrupt to print char in AL
    jmp ._loop          ; Repeat for next char

.done:
    ret                 ; Return from procedure

; -------------------------------
; MAIN PROGRAM
; -------------------------------
main:
    call print_char     ; Call the string print routine

    mov ah, 0Eh         ; Prepare to print one more char
    mov al, 'A'         ; Load 'A' into AL
    int 10h             ; Print it

    ret                 ; Exit program
