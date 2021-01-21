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
forPrintArrBeforeDelete:
	beq $t1, $t4, outForPrintArrBeforeDelete
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
j forPrintArrBeforeDelete
outForPrintArrBeforeDelete:

# in cau nhap k
li $v0, 4
la $a0, nhapk
syscall

# nhap k($t1)
li $v0, 5
syscall
move $t1, $v0

# set arr
la $s0, arr

# set n($t2)
lw $t2, n

# set i($t3)
move $t3, $t1
# compute address with k
sll $t1, $t1, 2
add $t1, $t1, $s0

forDelete:
	beq $t3, $t2, outForDelete
		# load word i
		lw $t4, 4($t1)
		# store word i + 4
		sw $t4, 0($t1)
	addi $t1, $t1, 4
	addi $t3, $t3, 1
j forDelete
outForDelete:

# n--
lw $t1, n
subi $t1, $t1, 1
sw $t1, n

# in arr sau khi swap
# set i($t1)
li $t1, 0
# set address($t2)
la $t2, arr
# set n($t4)
lw $t4, n
forPrintArrAftereDelete:
	beq $t1, $t4, outForPrintArrAftereDelete
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
j forPrintArrAftereDelete
outForPrintArrAftereDelete:

# return 0
li $v0, 10
syscall

.data
nhapk: .asciiz "\nnhap k: "
comma: .asciiz ", "
arr: .word 2, 1, 4, 1, 5, 3, 2, 1, 3, 4
n: .word 10
