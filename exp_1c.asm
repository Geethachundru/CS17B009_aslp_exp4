     .data
v1:  .word 13
v2:  .word 2
v3:  .word 0
v4:  .word 0
v5:  .word 0  #no: 0
v6:  .word 0  #no: 1
     .text 
     
main:
 lw $s0,v1
 lw $s1,v2
 addi $s6,$0,1
 addi $t4,$0,32
 lw $t0,v3
 lw $t1,v4
 lw $t2,v5
 lw $t3,v6
 addi $s2,$s2,1
 
 loop1:
 slt $s3,$t4,$s2
 bne $s3,$0,Exit
 div $s0,$s1
 mfhi $s4
 mflo $s0
 addi $s2,$s2,1
 beq $s4,$0,loop1
 beq $s4,$s6,loop2
 j loop1
 loop2:
 bne $t1,$0,loop4
 addi $t0,$t0,1
 j loop1     
 loop3:
 bne $t0,$0,loop4
 addi $t1,$t1,1
 j loop1
 loop4:
 xor $t0,$t0,$t0
 addi $t2,$t2,1
 j loop3 
 loop5:
 xor $t1,$t1,$t1
 addi $t3,$t3,1
 j loop2
 Exit:
 bne $t1,$0,loop6
 bne $t2,$0,loop7
 loop6:
 addi $t3,$t3,1
 j Exit1
 loop7:
 addi $t2,$t2,1
 j Exit1
 
Exit1:
sw $t2,v5
sw $t3,v6
j $ra
