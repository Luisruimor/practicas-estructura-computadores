.data
    # Exercise Header
    Practica:    .word 4
    Ejercicio:    .word 1

    Alumno_1:    .string "Luis Ruiz Moreno"

    # Exercise Data
    length: .word 7
    list:   .word 7
            .word 5
            .word -4
            .word 100
            .word -250
            .word 73
            .word -50

.text
begin:

    lw a0 length    # load length
    la a1 list      # load list
    jal ra, printNumberArray      # call procedure

    j end			# jump to end

#------------------------------------------------------------
printNumberArray:   # a0 : length
                    # a1 : list
                    # function: print an array of numbers
#------------------------------------------------------------
# save context
    addi sp, sp, -12		# move stack pointer to save context
    sw a0, 0(sp)
    sw a1, 4(sp)
    sw t2, 8(sp)
#------------------------------------------------------------
    mv t0, a0 			# copy length to t0
    mv t1, a1			# copy list to t1

    li t2, 0 			# loop counter

    loop:

        # print number
        lw a1, 0(t1)
        jal ra, printInt

        # print line feed
        jal ra, newLine

        addi t1, t1, 4 		# add 4 to the pointer to get the next number
        addi t2, t2, 1 		# add 1 to the loop counter
        bne t2, t0, loop    # if counter != length, repeat loop
        beq t2, t0, end    # if counter = length, end program
#------------------------------------------------------------
# restore context
    lw a0, 0(sp)
    lw a1, 4(sp)
    lw t2, 8(sp)
    addi sp, sp, 12		# move stack pointer to restore context
#------------------------------------------------------------
    jalr zero, ra, 0		# return main procedure
#------------------------------------------------------------------------------------------------


printInt:       # a1 : int value
                # a0 : System Call to print int
                # function : Print int value
begin_printInt:
#------------------------------------------------------------------------------------------------
# save context
    addi sp, sp, -8                     # Move stack pointer
    sw a0, 0(sp)                        # Store a0 value with offset
    sw a7, 4(sp)                        # Store a7 value with offset
#------------------------------------------------------------------------------------------------
    mv a0, a1                            # Load a1 value to a0

    # System Call -> print int
    li a7, 1
    ecall
#------------------------------------------------------------------------------------------------
end_printInt:
# restore context
    lw a0, 0(sp)
    lw a7, 4(sp)
    addi sp, sp, 8
#------------------------------------------------------------------------------------------------
    jalr zero, ra, 0                    # return to main program
#-------------------------------------------------------------------------------------------------


newLine:   # function : Print new line
# save context
    addi sp, sp, -8
    sw a0, 0(sp)
    sw a7, 4(sp)
begin_newLine:
#----------------------------------------------------------------------------------------------------
    li a0, 10                    # Load ASCII value for new line

    # System Call -> print ASCII
    li a7, 11
    ecall
#----------------------------------------------------------------------------------------------------
end_newLine:
# restore context
    lw a0, 0(sp)
    lw a7, 4(sp)
    addi sp, sp, 8
#----------------------------------------------------------------------------------------------------
    jalr zero, ra, 0                # return to main program
#----------------------------------------------------------------------------------------------------


end:
    li a7, 10                  # charge exit syscall
    ecall