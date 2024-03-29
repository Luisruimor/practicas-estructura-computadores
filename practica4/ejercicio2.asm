.data
    # Exercise Header
    Practica:    .word 4
    Ejercicio:    .word 2

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

    lw a0 length			# load length
    la a1 list 			    # load list

    jal ra, bubleSort		# call procedure to sort list

    jal ra, printNumberArray      # call procedure to print list


printNumberArray:   # a0 : length
                    # a1 : list
                    # function: print an array of numbers
#-----------------------------------------------
# save context
    addi sp, sp, -12		# move stack pointer to save context
    sw a0 0(sp)
    sw a1 4(sp)
    sw t2 8(sp)
#-----------------------------------------------
    mv t0 a0 		# copy length to t0

    li t1 0			# loop counter

    loop:

        # print number
        lw a3 0(a1)
        jal ra, printInt

        # print line feed
        jal ra,newLine

        addi a1 a1, 4 		# add 4 to the pointer to get the next number
        addi t1 t1, 1 		# add 1 to the loop counter
        bne t1 t0, loop 	# if counter != length, repeat loop
        beq t1, t0, end     # if counter = length, end program

    #print line feed
    jal ra,newLine
#-----------------------------------------------
# restore context
    lw a0 0(sp)
    lw a1 4(sp)
    lw t2 8(sp)
    addi sp, sp, 12		# move stack pointer to restore context
#-----------------------------------------------
    jalr zero, ra, 0		# return main program
#-----------------------------------------------


bubleSort:  # a0 : length
            # a1 : list
            # function: sort an array of numbers using buble sort algorithm
#-----------------------------------------------
# save context
    addi sp, sp, -28		# move stack pointer to save context
    sw a0 0(sp)
    sw a1 4(sp)
    sw t0 8(sp)
    sw t1 12(sp)
    sw t2 16(sp)
    sw t3 20(sp)
    sw ra 24(sp)
#-----------------------------------------------
    mv t0 a0 			# length
    mv t1 a1		    # list
    li t2 1 			# loop counter
#-----------------------------------------------
    loopSort:   # t1: list
                # t2: loop counter
                # function: sort list
#-----------------------------------------------
        lw t3 0(t1)		# load t1 in t3 with offset 0
        lw t4 4(t1)		# load t1 in t4 with offset 4

        blt t3 t4 continue 	# if t3 < t4, continue

        sw t4 0(t1)		# save t4 in t1 with offset 0
        sw t3 4(t1)		# save t3 in t1 with offset 4


        continue:       # function: continue loop
#-----------------------------------------------
        addi t1 t1, 4 		# add 4 to the pointer to get the next number
        addi t2 t2, 1 		# add 1 to the loop counter
        bne t2 t0, loopSort 	# if counter != length, repeat loop
#-----------------------------------------------
    addi a0 a0 -1		# length - 1
    li t0 1			    # t0 = 1
    beq a0 t0 restoreContext 	# if a0 = 1, restore context
    jal ra, bubleSort		    # call procedure to sort list (recursive)
#-----------------------------------------------
    restoreContext:
    lw a0 0(sp)
    lw a1 4(sp)
    lw t0 8(sp)
    lw t1 12(sp)
    lw t2 16(sp)
    lw t3 20(sp)
    lw ra 24(sp)
    addi sp sp 28		# move stack pointer to restore context
#-----------------------------------------------
    jalr zero ra 0 		# return main program
#-----------------------------------------------


printInt:       # a3 : int value
                # a0 : system Call to print int
                # function : print int value
begin_printInt:
#------------------------------------------------------------------------------------------------
# save context
    addi sp, sp, -8                     # move stack pointer
    sw a0, 0(sp)                        # store a0 value with offset
    sw a7, 4(sp)                        # store a7 value with offset
#------------------------------------------------------------------------------------------------
    mv a0, a3                            # load a3 value to a0

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