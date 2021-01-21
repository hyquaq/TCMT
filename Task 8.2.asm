.data  

list: .space 200
size: .word 0
comma: .asciiz ", "
nhapVti: .asciiz "\nnhap vi tri can xoa 1: "
nhapVtj: .asciiz "\nnhap vi tri can xoa 2: "
nhapn: .asciiz "\nnhap n: "
nhapSaiK: .asciiz "\nnhap sai k (0 <= k <= leng)\n"

.text
.globl main
main:
li $v0, 4
la $a0, nhapn
syscall
li $v0, 5
syscall
move $t1, $v0
sw $t1, size
# ---------------------------scant----------------------------------#
lw $t3, size
la $t1,  list
li $t2, 0

print_loop:  
	beq $t2, $t3, print_loop_end

	li $v0, 5
	syscall
	move $t7, $v0

	sw $t7, 0($t1)

	addi $t2, $t2, 1  
	addi $t1, $t1, 4 

	j  print_loop  
print_loop_end:  
# ---------------------------scant----------------------------------#


# ---------------------------BT2----------------------------------#
# nhap vi tri k = $s1
li $v0, 4
la $a0, nhapVti
syscall
li $v0, 5
syscall
move $s1, $v0

lw $t3, size
bgt $s1, $t3, outSailan1
blt $s1, $zero, outSailan1

la $t1, list
mul $t2, $s1, 4
add $t1, $t1, $t2
lw $t3, size
move $t2, $s1
fori:
	beq $t2, $t3, quiti
		lw $t4, 4($t1)
		sw $t4, 0($t1)
addi $t1, $t1, 4
addi $t2, $t2, 1
j fori
quiti:
j outSailan1D
outSailan1:
li $v0, 4
la $a0, nhapSaiK
syscall
j outPrint1
outSailan1D:
# ---------------------------BT2----------------------------------#

# ---------------------------print----------------------------------#
lw $t3, size
sub $t3, $t3, 1
sw $t3, size
outPrint1:
lw $t3, size
la $t1,  list
li $t2, 0

print_loop2:  
	beq $t2, $t3, print_loop_end2
	

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

	j  print_loop2
print_loop_end2: 
# ---------------------------print----------------------------------#

# ---------------------------BT2----------------------------------#
# nhap vi tri k = $s1
li $v0, 4
la $a0, nhapVti
syscall
li $v0, 5
syscall
move $s1, $v0

lw $t3, size
bgt $s1, $t3, outSailan2
blt $s1, $zero, outSailan2

la $t1, list
mul $t2, $s1, 4
add $t1, $t1, $t2
lw $t3, size
move $t2, $s1
fori2:
	beq $t2, $t3, quiti2
		lw $t4, 4($t1)
		sw $t4, 0($t1)
addi $t1, $t1, 4
addi $t2, $t2, 1
j fori2
quiti2:
j outSailan2D
outSailan2:
li $v0, 4
la $a0, nhapSaiK
syscall
j outPrint2
outSailan2D:
# ---------------------------BT2----------------------------------#

# ---------------------------print----------------------------------#
lw $t3, size
sub $t3, $t3, 1
sw $t3, size
outPrint2:
lw $t3, size
la $t1,  list
li $t2, 0

print_loop21:  
	beq $t2, $t3, print_loop_end21
	

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

	j  print_loop21
print_loop_end21:  
# ---------------------------print----------------------------------#