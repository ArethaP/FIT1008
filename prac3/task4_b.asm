.data
strsize: .asciiz "size: "
size: .word 0
stritem: .asciiz "item: "
the_list: .word 0
i: .word 0
item: .word 0
count: .word 0
strtarget: .asciiz "target: "
target: .word 0

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

sw $v0, the_list	# store allocated memory address in the_list
sw $t0, ($v0)		# store size at first word in the_list

# loop to read and save into list


# initialize counters
li $t0, 0	# t0 = i = 0
lw $t1, size

# fill list
loop: 
	#if i >= size endloop
	bge $t0, $t1, eloop

	# ask for item
	la $a0, stritem
	addi $v0, $0, 4
	syscall
	addi $v0, $0, 5
	syscall
	lw $t2, the_list #put the list address into $t2
	addi $t3, $0, 4 #$t3 = 4
	mult $t3, $t0 # 4 * i
	mflo $t4
	addi $t4, $t4, 4 #t4=i*4+4 
	add $t4, $t4, $t2 #$t4 points to next location in the list  
	sw $v0, ($t4) # store the next value 
	#print i
	la $a0, i
	addi $v0, $0, 4
	syscall
	addi $t0, $t0, 1 #i=i+1 
	j loop
eloop:

asktarget:
# ask for target
la $a0, strtarget
addi $v0, $0, 4
syscall
addi $v0, $0, 5
syscall
sw $v0, target

# re-initialise counters
	li $t0, 0	# t0 = i = 0
	lw $t1, the_list #$t1 = address of list
	lw $t2, ($t1) #$t2 = size of list
	lw $t7, target #$t7 holds target
	lw $t6, count #$t6 holds the number of times target appears

# find number of times target appears
findtarget:
	bge $t0, $t2, endloop2 #if index >= size, exit
	addi $t3, $0, 4 #$t3 = 4
	mult $t3, $t0 
	mflo $t4 #$t4 = 4*index
	add $t4,$t4,$t3 #$t4 = 4 * index + 4
	add $t4, $t4, $t1 #$t4 = address of the_list[i]
	lw $t5, ($t4) # $t5 holds the_list[i]
	#if $t5 == $t7
	seq $t3, $t5, $t7 #if equal, set to 1
	bne $t3, 1, nottar #jump if not eq
	#update count
	addi $t6, $t6, 1	
nottar:
	# i=+1
	addi $t0, $t0, 1
	j findtarget

endloop2:
	#save count into global
	sw $t6, count


#print number of times target appears
lw $a0, count
addi $v0, $0, 1
syscall


endloop4:
addi $v0, $0, 10
syscall
