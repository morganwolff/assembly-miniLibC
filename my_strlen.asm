BITS 64

section .text
    global my_strlen

my_strlen:
    push rbp
    mov rbp, rsp
    mov rax, 0
    cmp rdi, 0
    je end

boucle:
    cmp [rdi], byte 0
    je end
    inc rax
    inc rdi
    jmp boucle

end:
    leave
    ret