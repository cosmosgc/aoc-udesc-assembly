.data
    	prompt: .asciiz "Entre uma string: "
    	output: .asciiz "\nVocê digitou a string: "
    	input: .space 81
    	inputSize: .word 80

.text
    	# Solicitar a string ao usuário
    	li $v0, 4   
    	la $a0, prompt   
    	syscall

    	# Ler a string digitada pelo usuário
    	li $v0, 8   
    	la $a0, input   
    	li $a1, 81   
    	syscall

    	# Imprimir a confirmação da string
    	li $v0, 4   
    	la $a0, output   
    	syscall

 	# Carregar o endereço da string na memória para impressão
    	la $a0, input   

    	# Imprimir a string guardada
    	li $v0, 4   
    	syscall

    	# Encerrar o programa
    	li $v0, 10   
    	syscall



   
