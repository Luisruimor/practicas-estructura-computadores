.data
    # Exercise Header
    Practica:    .word 3
    Ejercicio:    .word 3

    Alumno_1:    .string "Luis Ruiz Moreno"

	# Exercise Data
    year: .word 2012

.text
begin:
    lw a1, year                                 # Load year value
    jal ra, checkBisiesto                       # call procedure

    # Print result
    mv a0, a2
    li a7, 1
    ecall

    j end

checkBisiesto:      # a1: year value
                    # a2: result
                    # Function: to check if year is leapYear


beginCheckBisisesto:
#----------------------
# save context
    addi sp, sp, -16    # move stack pointer to save context
    sw t0, 0(sp)
    sw t1, 4(sp)
    sw t2, 8(sp)
    sw t3, 16(sp)
#--------------------------------------------------------------------------------------------------------------
    li t0, 4
    li t1, 100
    li t2, 400

    rem t3, a1, t0  # remainder of year/4

firstStep:

    beq t3, zero, secondStep    # remainder = 0, next step
    bne t3, zero, noEsBisiesto  # remainder != 0, is not leapYear

secondStep:

    rem t3, a1, t2  # remainder of year/400
    beq t3, zero, esBisiesto  # remainder = 0, is leapYear
    bne t3, zero, thirdStep   # remainder != 0, next step
thirdStep:

    rem t3, a1, t1  # remainder of year/100
    beq t3, zero, noEsBisiesto  # remainder = 0, is not leapYear

esBisiesto:

    li a2, 1                                    # result = 1
    j restoreCheckBisiesto

noEsBisiesto:

    li a2, 0                                    # result = 0
#--------------------------------------------------------------------------------------------------------------
restoreCheckBisiesto:
    # restore context
    lw t0, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    lw t3, 16(sp)
    addi sp, sp, 16                            # move stack pointer to restore context

#--------------------------------------------------------------------------------------------------------------
    jalr zero, ra, 0                           # return main program
#--------------------------------------------------------------------------------------------------------------
end:
    # System Call -> exit
    li a7, 10
    ecall