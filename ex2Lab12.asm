.data
    	prompt: .asciiz "Entre uma string: "
    	output: .asciiz "\nVoc� digitou a string: "
    	input: .space 81
    	inputSize: .word 80

.text
    	# Solicitar a string ao usu�rio
    	li $v0, 4   
    	la $a0, prompt   
    	syscall

    	# Ler a string digitada pelo usu�rio
    	li $v0, 8   
    	la $a0, input   
    	li $a1, 81   
    	syscall

    	# Imprimir a confirma��o da string
    	li $v0, 4   
    	la $a0, output   
    	syscall

 	# Carregar o endere�o da string na mem�ria para impress�o
    	la $a0, input   

    	# Imprimir a string guardada
    	li $v0, 4   
    	syscall

    	# Encerrar o programa
    	li $v0, 10   
    	syscall



   
