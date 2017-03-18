.data
strsize: .asciiz "size: "
size: .word 0
stritem: .asciiz "item: "
the_list: .word 0
i: .word 0
item: .word 0
count: .word 0

.text
createlist:
# ask for size
la $a0, strsize
addi $v0, $0, 4
syscall
addi $v0, $0, 5
syscall
sw $v0, size

#create list
lw $t0, size
addi $t1, $0, 4
mult $t0, $t1
mflo $t2

add $a0, $t2, $t1
addi $v0, $0, 9 #9 = allocate memory
syscall

sw $v0, the_list
sw $t0, ($v0)

#add items to the list
#sw $0, i

loop: 
lw $t0, count
lw $t1, size
lw $t7, i

append:
#if count >= size:
bge $t0, $t1, loop2

#append:
# ask for item
la $a0, stritem
addi $v0, $0, 4
syscall
addi $v0, $0, 5
syscall
lw $t2, the_list #put the list address into $t2
addi $t3, $0, 4 #$t3 = 4
mult $t3, $t7 # 4 * i
mflo $t4
add $t4, $t4, $t3 #t4=i*4+4 
add $t4, $t4, $t2 #$t4 points to next location in the list  
sw $v0, ($t4) # store the next value 
addi $t0, $t0, 1 #i=i+1 
sw $t0, count 
#print i
la $a0, i
addi $v0, $0, 4
syscall
j append 


#print every second item in the list
addi $t0, $0, 0
loop2:
lw $t1, the_list
lw $t2, ($t1)

bge $t0, $t2, endloop2

addi $t3, $0, 4
mult $t3, $t0
mflo $t4
add $t4,$t4,$t3 #$t4=$t0*4+4
add $t4, $t4, $t1
lw $a0, ($t4) 
addi $v0, $0, 1  
syscall # print current item 
addi $a0, $0, 32 # print a space - ascii code 32  
addi $v0, $0, 11 
syscall 
addi $t0, $t0, 1 #$t0=$t0+1 
j loop2 

endloop2:
addi $v0, $0, 10
syscall