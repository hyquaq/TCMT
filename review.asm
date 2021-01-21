.text
.globl main

main:
li $v0, 4
la $a0, n
syscall
li $v0, 5
syscall
move $t1, $v0

li $t5, 10
li $t4, 0
for:
	div $t1, $t5
	mflo $t2
	mfhi $t3
	add $t4, $t4, $t3
	beq $t2, $zero, outfor
	move $t1, $t2
j for
outfor:

li $v0, 4
la $a0, tongso
syscall
li $v0, 1
move $a0, $t4
syscall

.data
tongso: .asciiz "\n tong cac chu so cua so da nhap: "
n: .asciiz "\n nhap n = "
ngay: .asciiz "\n ngay "
thang: .asciiz " thang "
nam: .asciiz " nam "
