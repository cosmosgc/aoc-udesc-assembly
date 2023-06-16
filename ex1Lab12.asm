.data
	num1: .word 4
    	num2: .word 6
    	soma: .word 0
    	mensagem: .asciiz "O resultado da soma é: "

.text
    	lw $t1, num1   
    	lw $t2, num2   
    	add $t3, $t1, $t2   
    	sw $t3, soma   
    
    	# Exibindo o resultado para o usuário
    	li $v0, 4   
    	la $a0, mensagem   
    	syscall

    	lw $a0, soma   
    	li $v0, 1  
    	syscall
    
    	# Encerrar o programa
    	li $v0, 10   
   	syscall
	