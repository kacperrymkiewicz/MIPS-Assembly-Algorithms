# int factorial (int n) {
#     int temp = 1;
#     for (i=1; i<n+1; i=i+1) {
#         temp=temp*i;
#     }
#     return temp;

.data
	n: .word 5
	
.text

main:
	lw $t0, n    # n
	li $t1, 1    # temp
	li $t2, 1    # i
	addi $t3, $t0, 1
	
	jal start_loop
	
	move $a0, $v0	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall


	start_loop:
		bge $t2, $t3, end_loop
		
		mul $t1, $t1, $t2
		addi $t2, $t2, 1
		
		j start_loop
	
	
	end_loop:
		move $v0, $t1
		jr $ra