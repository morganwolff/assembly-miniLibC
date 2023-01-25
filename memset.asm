BITS 64

section .text
    global memset

memset:
    xor rcx, rcx

loop:
    cmp rcx, rdx
    je out
    mov [rdi + rcx], sil
    inc rcx
    jmp loop

out:
    mov rax, rdi
    ret
