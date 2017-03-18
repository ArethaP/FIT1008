.data # assembly directive
str: .asciiz "Hello MIPS" # label for string called str. Global variable
.text # assembly directive
la $a0, str # load address of str into register 0. $a0 is a GPR
addi $v0, $0, 4 # put integer 4 into $v0. $0 is a GPR with special meaning of zero
syscall # system call: print(syscall 4) str at address loaded into $a0
addi $v0, $0, 10 # put integer 10 into $v0. $0 is a GPR with special meaning of zero
syscall # system call: exit(syscall 10)