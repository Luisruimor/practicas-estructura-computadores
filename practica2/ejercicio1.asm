.data
    # Exercise Header
    Practica:    .word 2
    Ejercicio:    .word 1

    Alumno_1:    .string "Luis_Ruiz_Moreno"

    # Exercise Data
    str_lower:	.string "puzzle"

.text
begin:
    la a0,str_lower	# load lowecase word

    li a7,4	# printString
    ecall

    mv t0,a0	# copy content a0 in t0

    li a0,10	# ASCII(10) = line feed
    li a7,11
    ecall

    # load all characters
    lb a1,0(t0)
    lb a2,1(t0)
    lb a3,2(t0)
    lb a4,3(t0)
    lb a5,4(t0)
    lb a6,5(t0)

    # change characters to uppercase
    addi t1, a1, -32	# lowercase - 32 = uppercase
    addi t2, a2, -32
    addi t3, a3, -32
    addi t4, a4, -32
    addi t5, a5, -32
    addi t6, a6, -32

    # write in a0 the uppercase characters
    sb t1, 0(a0)
    sb t2, 1(a0)
    sb t3, 2(a0)
    sb t4, 3(a0)
    sb t5, 4(a0)
    sb t6, 5(a0)

    li a7, 4	# printString
    ecall