## Name: Moinuddin Saiyed
## Student Number: 200489258


.data
prompt: .asciiz "Enter temperature in Fahrenheit: "
result_text: .asciiz "The temperature in Celsius is: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Prompt the user to enter temperature in Fahrenheit
    li $v0, 4              # syscall code for printing a string
    la $a0, prompt         # load prompt address
    syscall

    # Read Fahrenheit temperature from user
    li $v0, 5              # syscall code for reading an integer
    syscall
    move $t0, $v0          # store Fahrenheit value in $t0

    # Celsius calculation: C = 5 * (F - 32) / 9
    li $t1, 32             # load 32 into $t1
    sub $t2, $t0, $t1      # F - 32
    li $t3, 5              # load 5 into $t3
    mul $t2, $t2, $t3      # 5 * (F - 32)
    li $t4, 9              # load 9 into $t4
    div $t2, $t4           # (5 * (F - 32)) / 9

    # Move quotient result to Celsius output
    mflo $t5               # move result to $t5 (Celsius value)

    # Print the result
    li $v0, 4              # syscall code for printing a string
    la $a0, result_text    # load result text address
    syscall

    move $a0, $t5          # move Celsius value to $a0
    li $v0, 1              # syscall code for printing an integer
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
