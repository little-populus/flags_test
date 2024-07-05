.global test

.section .rodata
str:
.string "sign is: %d zero is: %d overflow is: %d carry is: %d\n"
shr:
.string "result of shr is:\n"
shl:
.string "result of shl is:\n"
sar:
.string "result of sar is:\n"
sal:
.string "result of sal is:\n"

input:
.string "data is %d\n"

.section .text
.extern printf

test:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %rdi, %r9
    movq %r9, -8(%rbp)

    leaq input(%rip), %rdi
    movq %r9, %rsi
    call printf

    # shr operation
    leaq shr(%rip), %rdi
    call printf
    movq -8(%rbp), %r9
    movq %r9, %rax
    shrb $1, %al
    call status

    # shl operation
    leaq shl(%rip), %rdi
    call printf
    movq -8(%rbp), %r9
    movq %r9, %rax
    shlb $1, %al
    call status

    # sar operation
    leaq sar(%rip), %rdi
    call printf
    movq -8(%rbp), %r9
    movq %r9, %rax
    sarb $1, %al
    call status

    # sal operation
    leaq sal(%rip), %rdi
    call printf
    movq -8(%rbp), %r9
    movq %r9, %rax
    salb $1, %al
    call status

    addq $16, %rsp
    popq %rbp
    ret

status:
    pushq %rbp
    movq %rsp, %rbp

    leaq str(%rip), %rdi

    # Check sign flag
    sets %sil
    movzbl %sil, %esi  # Zero extend byte to long

    # Check zero flag
    setz %dl
    movzbl %dl, %edx  # Zero extend byte to long

    # Check overflow flag
    seto %cl
    movzbl %cl, %ecx  # Zero extend byte to long

    # Check carry flag
    setc %r8b
    movzbl %r8b, %r8d  # Zero extend byte to long

    call printf
    movq %rbp, %rsp
    popq %rbp
    ret


.section .note.GNU-stack,"",@progbits
