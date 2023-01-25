BITS 64

section .text
    global strchr

strchr:
    
loop:
    cmp BYTE [rdi], sil
    je unnull
    cmp BYTE [rdi], 0
    je null
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