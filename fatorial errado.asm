.text
.globl main

main:
    li $v0, 4
    la $a0, prompt_num
    syscall

    li $v0, 5
    syscall
    move $s0, $v0   # Armazena o número fornecido em $s0

    jal factorial   # Chama a função recursiva para calcular o fatorial

    li $v0, 4
    la $a0, result_text
    syscall

    move $a0, $v0   # Imprime o resultado armazenado em $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

factorial:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    beqz $s0, base_case   # Verifica se o número é igual a zero (caso base)

    addi $s0, $s0, -1    # Decrementa o número em 1

    move $a0, $s0        # Passa o número decrementado como argumento
    jal factorial        # Chama recursivamente a função factorial

    lw $s0, 4($sp)       # Restaura o valor original de $s0

    mul $v0, $v0, $s0    # Calcula o fatorial: resultado = fatorial(n-1) * n

    lw $ra, 0($sp)
    addi $sp, $sp, 8
    jr $ra

base_case:
    li $v0, 1
    move $v0, $s0        # Armazena o valor de $s0 em $v0
    jr $ra

.data
prompt_num: .asciiz "Digite um número inteiro não negativo: "
result_text: .asciiz "O fatorial é: "
