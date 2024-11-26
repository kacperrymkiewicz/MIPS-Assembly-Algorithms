# int fib (int n) {
#    if (n==0)
#        return 0;
#    else if (n==1)
#        return 1;
#    else
#        return fib(n-1) + fib(n-2);
# }

.data
	n: .word 8
.text

main:
	lw $a0, n
	
	jal fib_recurse
	move $a0, $v0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

fib_recurse:
	beq $a0, $zero, fib_case1

	li $t0, 1
    	beq $a0, $t0, fib_case2
    	
    	subi $sp, $sp, 12
    	sw $ra, 0($sp)
    	
    	sw $a0, 4($sp)
    	subi $a0, $a0, 1
    	jal fib_recurse
    	lw $a0, 4($sp)
    	sw $v0, 8($sp)
    	
    	subi $a0, $a0, 2
    	jal fib_recurse
    	
    	lw $t0, 8($sp)
    	add $v0, $t0, $v0
    	
    	lw $ra, 0($sp)
    	addi $sp, $sp, 12
    	jr $ra

fib_case1:
	li $v0, 0
	jr $ra

fib_case2:
	li $v0, 1
	jr $ra
