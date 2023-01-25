BITS 64

section .text
    global memcpy

memcpy:
    xor rcx, rcx
    cmp rdi, 0
    je out
    cmp rsi, 0
    je out
    cmp rdx, 0
    je out

loop:
    cmp byte [rsi + rcx], 0
    je out
    cmp rcx, rdx
    je out
    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b
    inc rcx
    jmp loop

out:
    mov rax, rdi
    ret