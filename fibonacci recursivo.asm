.text
.globl main

main:
   	li $v0, 1          # Definindo o código do syscall para impressão de inteiro
    	addi $s0, $zero, 0 # Inicializando o contador do loop
    	addi $s1, $zero, 1 # Inicializando o primeiro número da sequência
    	addi $s2, $zero, 1 # Inicializando o segundo número da sequência

fibonacci_loop:
    	# Imprime o número atual da sequência
    	move $a0, $s1
    	syscall

    	# Calcula o próximo número da sequência
    	add $s3, $s1, $s2

    	# Atualiza os valores dos números
    	move $s1, $s2
    	move $s2, $s3

    	addi $s0, $s0, 1  # Incrementa o contador do loop
    	bne $s0, 10, fibonacci_loop  # Pula para o início do loop se o contador não for igual a 10

    	li $v0, 10        # Definindo o código do syscall para encerrar o programa
    	syscall           # Realizando a syscall para encerrar o programa