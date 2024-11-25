# int pow(int x, int n) {
#     int temp=1;
#         for (i=1; i<n+1; i=i+1) {
#             temp=temp*x;
#         }
#     return temp;
#

.data
	x: .word 4
	n: .word 3
	
.text
main:
	lw $a0, x
	lw $a1, n

	li $t0, 1  # temp
	addi $t1, $a1, 1
	li $t2, 1  # i
	loop_start:
		bge $t2, $t1, loop_end
		
		mul $t0, $t0, $a0
		addi $t2, $t2, 1
		j loop_start
	
	loop_end:
		li $v0, 1
		move $a0, $t0
		syscall
	
		li $v0, 10
		syscall
	
