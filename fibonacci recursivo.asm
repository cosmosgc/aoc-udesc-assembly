.text
.globl main

main:
   	li $v0, 1          # Definindo o c�digo do syscall para impress�o de inteiro
    	addi $s0, $zero, 0 # Inicializando o contador do loop
    	addi $s1, $zero, 1 # Inicializando o primeiro n�mero da sequ�ncia
    	addi $s2, $zero, 1 # Inicializando o segundo n�mero da sequ�ncia

fibonacci_loop:
    	# Imprime o n�mero atual da sequ�ncia
    	move $a0, $s1
    	syscall

    	# Calcula o pr�ximo n�mero da sequ�ncia
    	add $s3, $s1, $s2

    	# Atualiza os valores dos n�meros
    	move $s1, $s2
    	move $s2, $s3

    	addi $s0, $s0, 1  # Incrementa o contador do loop
    	bne $s0, 10, fibonacci_loop  # Pula para o in�cio do loop se o contador n�o for igual a 10

    	li $v0, 10        # Definindo o c�digo do syscall para encerrar o programa
    	syscall           # Realizando a syscall para encerrar o programa