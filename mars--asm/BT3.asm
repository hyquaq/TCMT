.text
.globl main
main:
# in dong chu
li $v0,4
la $a0, beforeSort
syscall

# set n($t3)
lw $t3, n

# set address($t1)
la $t1,  arr

# i($t2)
li $t2, 0

printBeforeSort:  
	beq $t2, $t3, outPrintBeforeSort 
		# in a[i]
		lw $t7, 0($t1)
		li $v0, 1
		move $a0, $t7
		syscall
	
		# in ,
		li $v0, 4
		la $a0, comma
		syscall
	
	addi $t2, $t2, 1 
	addi $t1, $t1, 4

j  printBeforeSort
outPrintBeforeSort:  

# set i = $t1, n = $t0
li $t1, 0
lw $t0, n 
la $s1, arr
fori:
	beq $t1, $t0, outi
	# set j = $t2 = $t1 + 1
	addi $t2, $t1, 1
	forj:
		beq $t2, $t0, outj		
		
		# a[i] a[j] i = $t3 j = $t4
		sll $t3, $t1, 2
		add $t3, $t3, $s1
		sll $t4, $t2, 2
		add $t4, $t4, $s1
		
		# a[i] = $t5
		# a[j] = $t6
		lw $t5, 0($t3)
		lw $t6, 0($t4)
		
		ble $t5, $t6, outLess
			sw $t6, 0($t3)
			sw $t5, 0($t4)
		outLess:
	addi $t2, $t2, 1	
	j forj
	outj:
	
addi $t1, $t1, 1
j fori
outi:

li $v0,4
la $a0, afterSort
syscall

# set n($t3)
lw $t3, n

# set address($t1)
la $t1,  arr

# i($t2)
li $t2, 0

printAfterSort:  
	beq $t2, $t3, outPrintAfterSort
		# print a[i]
		lw $t7, 0($t1)
		li $v0, 1
		move $a0, $t7
		syscall
	
		# in ,
		li $v0, 4
		la $a0, comma
		syscall

	addi $t2, $t2, 1
	addi $t1, $t1, 4

	j  printAfterSort
outPrintAfterSort:  

li $v0, 10
syscall

.data  
arr: .word 10, 3, 1, 2, 5, 9, 7, 6, 5, 11
n: .word 10 
comma: .asciiz ", "
afterSort: .asciiz "\nafter sort: "
beforeSort: .asciiz "\nbefore sort: "