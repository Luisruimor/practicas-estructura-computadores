.data
    # Exercise Header
    Practica:    .word 3
    Ejercicio:    .word 2

    Alumno_1:    .string "Luis Ruiz Moreno"

	# Exercise Data
    int: .word 11
    string: .string "Prueba procedimiento imprimir string"

.text
begin:
    lw a1, int      # Load int value
    jal ra,  printInt       # Call printInt procedure

    jal ra, newLine     # Call newLine procedure

    la a1, string   # Load string address
    jal ra,  printString  # Call printString procedure

    j exit

#------------------------------------------------------------------------------------------------
printInt:       # a1 : int value
                # a0 : System Call to print int
                #Function : Print int value
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


printString:    #a1 : string address
                #a0 : System Call to print string
                #Function : Print string value
# save context
    addi sp, sp, -8                    # Move stack pointer
    sw a0, 0(sp)                       # Store a0 value with offset
    sw a7, 4(sp)                       # Store a7 value with offset
begin_printString:
#---------------------------------------------------------------------------------------------------
    mv a0, a1                        # Load a1 value to a0

    # System Call -> print string
    li a7, 4
    ecall
#----------------------------------------------------------------------------------------------------
end_printString:
# restore context
    lw a0, 0(sp)
    lw a7, 4(sp)
    addi sp, sp, 8
#----------------------------------------------------------------------------------------------------
    jalr zero, ra, 0                # return to main program
#----------------------------------------------------------------------------------------------------


newLine:   #Function : Print new line
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


exit:
    # System Call -> exit
    li a7, 10
    ecall