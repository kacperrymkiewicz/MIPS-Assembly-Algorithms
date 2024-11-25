# int factorial(int n) {
#     if (n==0)
#         return 1;
#     else
#         return n*factorial(n-1);

.data
	n: .word 3
	
.text

main:
	lw $a0, n

	jal factorial
	move $a0, $v0
	
	li $v0, 1
	syscall

	li $v0, 10
	syscall
	
factorial:
	beq $a0, $zero, base_case
	
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	subi $a0, $a0, 1
	jal factorial
	
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 8
	
	mul $v0, $a0, $v0
	jr $ra

base_case:
	li $v0, 1
	jr $ra