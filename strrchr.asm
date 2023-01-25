BITS 64

section .text
    global strrchr

strrchr:
    xor rcx, rcx
    xor r8, r8

    cmp rdi, 0
    je null
    cmp sil, 0
    je null

loop1:
    cmp BYTE [rdi + r8], sil
    je incr
    cmp BYTE [rdi + r8], 0
    je isnull
    inc r8
    jmp loop1

incr:
    inc rcx
    inc r8
    jmp loop1

isnull:
    cmp rcx, 0
    je null
    cmp rcx, 0
    jne loop
    
loop:
    cmp BYTE [rdi], sil
    je decr
    inc rdi
    jmp loop

decr:
    dec rcx
    cmp rcx, 0
    je unnull
    inc rdi
    jmp loop

null:
    mov rax, 0
    jmp end

unnull:
    mov rax, rdi
    jmp end

end:
    ret