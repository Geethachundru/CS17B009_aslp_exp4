.data
   m: .word 3
   q: .word 5
   a: .word 0 
   r: .word 0
.text

main:
  	lw $s0,m
	lw $s1,q
	lw $t7,a
	lw $t8,r
	add $t6,$t6,$0
	add $t0,$t0,$0
	add $t1,$t1,$1
	add $s3,$s3,$0
loop:
	slti $s2,$s3,32
	beq $s2,$0,Exit1
	and $t2,$s1,$t1
	srl $s1,$s1,1
	beq $t2,$t1,loop1
	beq $t2,$t0,loop2
	
loop1:
	add $t7,$s0,$t7
	and $t4,$t7,$t1
	sllv $t4,$t4,$t6
	add $t6,$t6,$t1
	add $t8,$t8,$t4
	srl $t7,$t7,1
	add $s3,$s3,$t1
	j loop

loop2:
	and $t5,$t7,$t1
	sllv $t5,$t5,$t6
	add $t6,$t6,$t1
	add $t8,$t8,$t5
	srl $t7,$t7,1
	add $s3,$s3,$t1
	j loop

Exit1:
	sw $t8,r
	sw $t7,a
jr $ra
