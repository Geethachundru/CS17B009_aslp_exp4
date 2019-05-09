data
v1:  .word -2147483648   
v2:  .word 0
v3:  .word 0
v4:  .word -2147483648   #LSB
v5:  .word -2147483648   #MSB
v6:  .word 0
v7:  .word 0
v8:  .word -2147483648  
v9:  .word 0           #c1
v10: .word 0           #s1
v11: .word 0           #c2
v12: .word 0  	       #s2
v13: .word 0           #c3
v14: .word 0           #s3
v15: .word 0           #c4
v16: .word 0           #s4
v17:  .word 1
v18:  .word 0         #overflow
     .text 
     
main:
 lw $s0,v4         
 lw $s1,v8           
 lw $s3,v17
 sll $s3,$s3,31
 and $t0,$s0,$s3     
 and $t1,$s1,$s3     
 addu $t2,$s0,$s1    
 and $t3,$t2,$s3
 xor $t4,$t0,$t1
 and $t5,$t0,$t1
 nor $t6,$t6,$0
 and $t7,$t6,$t4
 add $s4,$t5,$t7   
 srl $s4,$s4,31
 sw $s0,v8
 sw $s1,v4
 sw $t2,v10
 sw $s4,v9

lw $s0,v3
lw $s1,v7
and $t0,$s0,$s3      
and $t1,$s1,$s3      
addu $t2,$s0,$s4    
and $t3,$t2,$s3
nor $t3,$0,$t3
and $s4,$t0,$t3   
addu $t4,$t2,$s1  
and $t5,$t2,$s3
and $t6,$s1,$s3
and $t7,$t4,$s3
nor $t8,$0,$t7
and $s5,$t5,$t6
xor $s6,$t5,$t6
and $t8,$t8,$s6
add $s7,$t8,$s5    
add $s4,$s4,$s7
srl $s4,$s4,31
 sw $s0,v2
 sw $s1,v7
 sw $t4,v12
 sw $s4,v11


lw $s0,v2
lw $s1,v6
and $t0,$s0,$s3      #a
and $t1,$s1,$s3      #b
addu $t2,$s0,$s4    #sum
and $t3,$t2,$s3
nor $t3,$0,$t3
and $s4,$t0,$t3   #carry=s'.a
addu $t4,$t2,$s1  #sum
and $t5,$t2,$s3
and $t6,$s1,$s3
and $t7,$t4,$s3
nor $t8,$0,$t7
and $s5,$t5,$t6
xor $s6,$t5,$t6
and $t8,$t8,$s6
add $s7,$t8,$s5    #carry=s'(s' xor b)+ (s'b)
add $s4,$s4,$s7
srl $s4,$s4,31
 sw $s0,v2
 sw $s1,v6
 sw $t4,v14
 sw $s4,v13

lw $s0,v1
lw $s1,v5
and $t0,$s0,$s3      #a
and $t1,$s1,$s3      #b
addu $t2,$s0,$s4    #sum
and $t3,$t2,$s3
nor $t9,$0,$t3
and $s4,$t0,$t9   #carry=s'.a
addu $t4,$t2,$s1  #sum
and $t5,$t2,$s3
and $t6,$s1,$s3
and $t7,$t4,$s3
nor $t8,$0,$t7
nor $s2,$0,$t7
and $s5,$t5,$t6
xor $s6,$t5,$t6
and $t8,$t8,$s6
add $s7,$t8,$s5    #carry=s'(s' xor b)+ (s'b)
add $s4,$s4,$s7
srl $s4,$s4,31
 sw $s0,v1
 sw $s1,v5
 sw $t4,v16
 sw $s4,v15

lw $s3,v18      #to check over flow 
and $t0,$t3,$t1
and $t0,$t0,$s2
nor $t3,$0,$t3
nor $t1,$0,$t1
and $t1,$t3,$t1
and $t1,$t1,$t7
srl $t1,$t1,31
srl $t0,$t0,31
add $s3,$t0,$t1
sw $s3,v18
j $ra


