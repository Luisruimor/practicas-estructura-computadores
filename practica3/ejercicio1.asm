.data
    # Exercise Header
    Practica:    .word 3
    Ejercicio:    .word 1

    Alumno_1:    .string "Luis Ruiz Moreno"

	# Exercise Data
    year: .word 200
    bisiesto: .string " es bisiesto"
    noBisiesto: .string " no es bisiesto"

.text
begin:
    # Print the year
    lw a0,year
    li a7, 1
    ecall

    # Load the year and the numbers that are necessary to check if it is a leap year
    lw a1, year
    li t0, 4
    li t1, 100
    li t2, 400

    rem t3, a1, t0  # remainder of year/4

firstStep:

    beq t3, zero, secondStep    # remainder = 0, next step
    bne t3, zero, noLeapYear  # remainder != 0, is not leapYear

secondStep:

    rem t3, a1, t2  # remainder of year/400
    beq t3, zero, leapYear  # remainder = 0, is leapYear
    bne t3, zero, thirdStep   # remainder != 0, next step
thirdStep:

    rem t3, a1, t1  # remainder of year/100
    beq t3, zero, noLeapYear  # remainder = 0, is not leapYear
leapYear:

    la a0, bisiesto # Load in a0 the result (leap year)
    j end   # Jump to the end of the program

noLeapYear:

    la a0, noBisiesto # Load in a0 the result (no leap year)

end:
    # Print the result
    li a7, 4
    ecall

    # System Call -> exit
    li a7, 10
    ecall