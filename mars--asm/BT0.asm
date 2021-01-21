.text
.globl main
main:

# xuat ra cau nhap n
li $v0, 4
la $a0, nhapn
syscall

# nhap n($t1)
li $v0, 5
syscall
move $t1, $v0

# set i($t2)
li $t2, 0
# set address($t4)
la $t4, arr
forNhapN:
	# i != n
	beq $t2, $t1, outForNhapN
		# nhap a[i]($t3)
		li $v0, 5
		syscall
		move $t3, $v0
		
		sw $t3, 0($t4)

	addi $t4, $t4, 4
	addi $t2, $t2, 1			
j forNhapN
outForNhapN:

# set i($t2)
li $t2, 0
# set address ($t4)
la $t4, arr
forXuatArr:
	# i != n
	beq $t2, $t1, outForXuatArr
		# xuat a[i]($t5)
		lw $t3, 0($t4)
		li $v0, 1
		move $a0, $t3
		syscall
		
		# xuat ,
		li $v0, 4
		la $a0, comma
		syscall
	addi $t2, $t2, 1
	addi $t4, $t4, 4
j forXuatArr
outForXuatArr:

# return 0
li $v0, 10
syscall

.data
nhapn: .asciiz "\n nhap n = "
arr: .space 100
comma: .asciiz ", "