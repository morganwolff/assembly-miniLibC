BITS 64

section .text
    global strncmp

strncmp:
    xor rcx, rcx

loop:
    mov al, [rdi + rcx] 
    mov r8b, [rsi + rcx]
    cmp rdx, 0
    je third_arg_zero
    cmp al, 0
    je end
    cmp r8b, 0
    je end
    cmp al, r8b
    jne end
    inc rcx
    cmp rcx, rdx
    je end
    jmp loop

third_arg_zero:
    mov rax, 0
    ret

end:
    sub al, r8b
    movsx rax, al
    ret
