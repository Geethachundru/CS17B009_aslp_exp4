.data
   	a1:   .byte 'a', 'b', 'c'
   	a2:   .byte 'd', 'e', 'f'
.text
main:
    	addi $s0,$0,0
	lb $t3,a1($s0)
	addi $s0,$s0,1
	lb $t4,a1($s0)
	addi $s0,$s0,1
	lb $t5,a1($s0)
	addi $s0,$0,0
	lb $t6,a2($s0)
	addi $s0,$s0,1
	lb $t7,a2($s0)
	addi $s0,$s0,1
	lb $t8,a2($s0)
	addi $s0,$0,0
	sb $t6,a1($s0)
	addi $s0,$s0,1
	sb $t7,a1($s0)
	addi $s0,$s0,1
	sb $t8,a1($s0)
	addi $s0,$0,0
	sb $t3,a2($s0)
	addi $s0,$s0,1
	sb $t4,a2($s0)
	addi $s0,$s0,1
	sb $t5,a2($s0)
	addi $s0,$0,0
	lb $s1,a1($s0)
	addi $s0,$s0,1
	lb $s2,a1($s0)
	addi $s0,$s0,1
	lb $s3,a1($s0)
        addi $s0,$0,0
	lb $s4,a2($s0)
	addi $s0,$s0,1
	lb $s5,a2($s0)
	addi $s0,$s0,1
	lb $s6,a2($s0)
        jr $ra
