BITS 64

section .text
    global strcasecmp

strcasecmp:
    xor rcx, rcx

loop:
    mov al, [rdi + rcx] 
    mov r8b, [rsi + rcx]

    cmp al, 0
    je out
    cmp r8b, 0
    je out

    cmp al, r8b
    je end
    cmp al, r8b
    jg greater
    cmp al, r8b
    jl lower

greater:
	sub	al, 32
	jmp	end_greater

lower:
	add	r8b, 32
    jmp end_lower

end_greater:
    cmp al, r8b
    jne post_end_greater
    inc rcx
    jmp loop

post_end_greater:
    add al, 32
    cmp al, r8b
    jne out
    inc rcx
    jmp loop

end_lower:
    cmp al, r8b
    jne post_end_lower
    inc rcx
    jmp loop

post_end_lower:
    sub r8b, 32
    cmp al, r8b
    jne out
    inc rcx
    jmp loop

end:
    cmp al, r8b
    jne out
    inc rcx
    jmp loop

out:
    sub al, r8b
    movsx rax, al
    ret