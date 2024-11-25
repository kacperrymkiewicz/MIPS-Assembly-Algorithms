#int pow(int x, int n) {
#    if (n==0)
#        return 1;
#    else
#        return x*pow(x,n-1);
#}

.data
	x: .word 4
	n: .word 3
	
.text

main:
	lw $a0, x
	lw $a1, n
	
	jal pow
    	move $a0, $v0
	
	# print 
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
pow:
	beq $a1, $zero, base_case
	
	addi $fp, $fp, -12
	sw $a0, 0($fp)
	sw $a1, 4($fp)
	sw $ra, 8($fp)
	
	subi $a1, $a1, 1
	jal pow
	
	lw $ra, 8($fp)
	lw $a1, 4($fp)
	lw $a0, 0($fp)
	addi $fp, $fp, 12
	
	mul $v0, $a0, $v0
	jr $ra
	
	
base_case:
	li $v0, 1
	jr $ra
