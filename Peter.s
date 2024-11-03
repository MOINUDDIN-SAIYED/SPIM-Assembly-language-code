## Name: Moinuddin Saiyed
## Student Number: 200489258





.data
prompt_name: .asciiz "Hello, what is your name?\n"
prompt_age: .asciiz "How old are you?\n"
newline: .asciiz "\n"
result_text1: .asciiz " is "
result_text2: .asciiz " years old.\n"

# Reserve space for user input
name: .space 20  # allocate 20 bytes for the name
age: .word 0     # allocate space for the age integer

.text
.globl main

main:
    # Print "Hello, what is your name?"
    li $v0, 4
    la $a0, prompt_name
    syscall

    # Read the user's name
    li $v0, 8       # syscall code for reading a string
    la $a0, name    # buffer to store the input name
    li $a1, 20      # maximum number of bytes to read
    syscall

    # Print "How old are you?"
    li $v0, 4
    la $a0, prompt_age
    syscall

    # Read the user's age
    li $v0, 5       # syscall code for reading an integer
    syscall
    sw $v0, age     # store the input age into the memory location for age

    # Print the result "<name>\nis <age> years old.\n"
    
    # Print name
    li $v0, 4
    la $a0, name
    syscall

    # Print " is "
    li $v0, 4
    la $a0, result_text1
    syscall

    # Print age
    lw $a0, age     # load age into $a0 for printing
    li $v0, 1       # syscall code for printing an integer
    syscall

    # Print " years old.\n"
    li $v0, 4
    la $a0, result_text2
    syscall

    # Exit
    li $v0, 10
    syscall
