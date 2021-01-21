.text
.globl main

main:
# in arr truoc khi swap
# set i($t1)
li $t1, 0
# set address($t2)
la $t2, arr
# set n($t4)
lw $t4, n
forPrintArrBeforeSwap:
	beq $t1, $t4, outForPrintArrBeforeSwap
		# a[i]($t3)
		lw $t3, 0($t2)
		li $v0, 1
		move $a0, $t3
		syscall
		
		# in dau ,
		li $v0, 4
		la $a0, comma
		syscall
		
	addi $t1, $t1, 1
	addi $t2, $t2, 4
j forPrintArrBeforeSwap
outForPrintArrBeforeSwap:

# in cau nhap a
li $v0, 4
la $a0, nhapa
syscall

# nhap a($t1)
li $v0, 5
syscall
move $t1, $v0

# in cau nhap b
li $v0, 4
la $a0, nhapb
syscall

# nhap b($t2)
li $v0, 5
syscall
move $t2, $v0

# set arr
la $s0, arr

# compute address with a b
sll $t1, $t1, 2
sll $t2, $t2, 2
add $t1, $t1, $s0
add $t2, $t2, $s0

# load word
lw $t3, 0($t1)
lw $t4, 0($t2)

# store word
sw $t4, 0($t1)
sw $t3, 0($t2)

# in arr sau khi swap
# set i($t1)
li $t1, 0
# set address($t2)
la $t2, arr
# set n($t4)
lw $t4, n
forPrintArrAftereSwap:
	beq $t1, $t4, outForPrintArrAftereSwap
		# a[i]($t3)
		lw $t3, 0($t2)
		li $v0, 1
		move $a0, $t3
		syscall
		
		# in dau ,
		li $v0, 4
		la $a0, comma
		syscall
		
	addi $t1, $t1, 1
	addi $t2, $t2, 4
j forPrintArrAftereSwap
outForPrintArrAftereSwap:

# return 0
li $v0, 10
syscall

.data
nhapa: .asciiz "\nnhap a: "
nhapb: .asciiz "\nnhap b: "
comma: .asciiz ", "
arr: .word 2, 1, 4, 1, 5, 3, 2, 1, 3, 4
n: .word 10
