BITS 64

section .text
    global strstr

strstr:
    xor rcx, rcx
    xor rbx, rbx
    mov r8b, [rsi]
    cmp r8b, 0
    je unnull

pre_loop:
    mov rbx, 0
    mov rcx, 0

loop:
    mov r8b, [rsi]
    cmp r8b, 0
    je null
    cmp BYTE [rdi], 0
    je null
    cmp BYTE [rdi], r8b
    je eq
    inc rdi
    jmp loop

eq:
    inc rbx
    inc rcx
    mov r8b, [rsi + rcx] 
    cmp r8b, 0
    je unnull
    cmp BYTE [rdi + rbx], 0
    je null
    cmp BYTE [rdi + rbx], r8b
    jne eq_suite
    jmp eq

eq_suite:
    inc rdi
    jmp pre_loop

null:
    mov rax, 0
    jmp end

unnull:
    mov rax, rdi
    jmp end

end:
    ret