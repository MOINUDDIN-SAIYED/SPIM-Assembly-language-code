## Name: Moinuddin Saiyed
## Student Number: 200489258

.data
prompt: .asciiz "Enter a value for X: "
ans1: .asciiz "Answer = "
endl: .asciiz "\n"

# Constants A, B, C
A: .word 3
B: .word 4
C: .word 5

.text
.globl main

main:
    # Prompt the user to enter a value for X
    li $v0, 4              # syscall code for printing a string
    la $a0, prompt         # load prompt address
    syscall

    # Read integer value for X from user
    li $v0, 5              # syscall code for reading an integer
    syscall
    move $t0, $v0          # store user input (X) in $t0

    # Load constants A, B, C
    lw $t1, A              # load A into $t1
    lw $t2, B              # load B into $t2
    lw $t3, C              # load C into $t3

    # Calculate A*X^2 + B*X + C
    mul $t4, $t0, $t0      # t4 = X^2
    mul $t4, $t4, $t1      # t4 = A*X^2
    mul $t5, $t2, $t0      # t5 = B*X
    add $t4, $t4, $t5      # t4 = A*X^2 + B*X
    add $t4, $t4, $t3      # t4 = A*X^2 + B*X + C

    # Print the result
    li $v0, 4              # syscall code for printing a string
    la $a0, ans1           # load answer label
    syscall

    move $a0, $t4          # move result to $a0 for printing
    li $v0, 1              # syscall code for printing an integer
    syscall

    # Print newline
    li $v0, 4
    la $a0, endl
    syscall

    # Exit program
    li $v0, 10
    syscall
