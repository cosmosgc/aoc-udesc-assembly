# Inicializando os registradores
    .data
n:  .word 10           # Valor de n (defina o valor desejado)
total: .word 0         # Inicializando total como 0

    .text
    .globl main

main:
    # Inicializando os registradores
    li $t0, 0           # Registrador $t0 para o índice i
    li $t1, 0           # Registrador $t1 para o total

loop:
    # Condição de saída do loop
    lw $t2, n           # Carrega o valor de n em $t2
    slt $t3, $t0, $t2   # Verifica se i < n
    beq $t3, $0, exit   # Se i >= n, sair do loop

    # Verifica se i % 5 > 2
    addi $t4, $t0, 1    # Incrementa i em 1
    rem $t5, $t4, 5     # Calcula i % 5
    slti $t6, $t5, 3    # Verifica se i % 5 > 2
    beq $t6, $0, continue  # Se i % 5 <= 2, continuar para a próxima iteração

    # Adiciona i ao total
    add $t1, $t1, $t0

continue:
    # Incrementa i em 1
    addi $t0, $t0, 1
    j loop             # Salta para a próxima iteração do loop

exit:
    # Armazena o total na variável total
    sw $t1, total

    # Exibe o resultado para o usuário
    li $v0, 1           # Código do syscall para exibir um inteiro
    lw $a0, total       # Carrega o valor de total em $a0
    syscall

    # Fim do programa
    li $v0, 10
    syscall
