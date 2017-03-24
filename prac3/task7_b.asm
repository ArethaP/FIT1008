.data
strsize: .asciiz "size: "
size: .word 0
stritem: .asciiz "item: "
the_list: .word 0
item: .word 0
count: .word 0

.text
main:

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
#CALLER PREP
#save temp reg on stack
#none

#pass arguments on stack (one arg, the_list)
addi $sp, $sp, -4  # make space for 1 arg
lw $t0, the_list
sw $t0, 0($sp)

#call function
jal quicksort


#CALLER CLEAN UP
# clear arg off stack

#restore temp reg off stack
# use return value stored in $v0

end: #terminate code
addi $v0, $0, 10
syscall 





############# QUICKSORT FUNCTION ################
quicksort:

# CALLEE PREP
# save $ra and $fp on stack 
addi $sp, $sp, -8
sw $ra, 4($sp)
sw $fp, 0($fp)

# copy $sp to $fp
addi $fp, $sp, $0

#allocate local var on stack
addi $sp, $sp, -16
lw $t0, -8($fp)
sw $t0, 0($sp) # size

sw $0, -4($sp) # less list
sw $0, -8($sp) # equal list
sw $0, -12($sp) # greater list




##### start function ######
lw $t0, 0($sp) #size
addi $t1, $0, 1
sgt $t2, $t0, $t1 # 1 if size > 1

beq true 







# CALLEE CLEAN UP
# set $v0 to return value
# clear local var off stack
# restore saved $ra and $fp from stack
# return to caller with jr $ra

