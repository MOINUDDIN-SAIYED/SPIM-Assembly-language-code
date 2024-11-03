.data
msg1:    .asciiz "Enter first number: "
msg2:    .asciiz "Enter second number: "
msg3:    .asciiz "Enter operator (+,-,*,/): "
result_msg: .asciiz "The result is: "
newline: .asciiz "\n"

.text
.globl main
main:
    # Prompt and read the first number
    li $v0, 4               # syscall to print string
    la $a0, msg1
    syscall

    li $v0, 5               # syscall to read integer
    syscall
    move $t0, $v0           # store first number in $t0

    # Prompt and read the second number
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0           # store second number in $t1

    # Prompt and read the operator
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 12              # syscall to read a character
    syscall
    move $t2, $v0           # store operator in $t2

    # Perform the calculation based on operator
    li $t3, 0               # initialize result in $t3

    # Check if operator is '+'
    li $t4, '+'
    beq $t2, $t4, add_op

    # Check if operator is '-'
    li $t4, '-'
    beq $t2, $t4, sub_op

    # Check if operator is '*'
    li $t4, '*'
    beq $t2, $t4, mul_op

    # Check if operator is '/'
    li $t4, '/'
    beq $t2, $t4, div_op

    # Default case: Invalid operator (skips calculation)
    j end

# Addition Operation
add_op:
    add $t3, $t0, $t1       # $t3 = $t0 + $t1
    j display_result

# Subtraction Operation
sub_op:
    sub $t3, $t0, $t1       # $t3 = $t0 - $t1
    j display_result

# Multiplication Operation
mul_op:
    mul $t3, $t0, $t1       # $t3 = $t0 * $t1
    j display_result

# Division Operation
div_op:
    beq $t1, $zero, end     # Check for division by zero
    div $t0, $t1
    mflo $t3                # $t3 = quotient
    j display_result

# Display Result
display_result:
    li $v0, 4               # syscall to print string
    la $a0, result_msg
    syscall

    move $a0, $t3           # move result to $a0 for printing
    li $v0, 1               # syscall to print integer
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

end:
    li $v0, 10              # syscall to exit
    syscall
