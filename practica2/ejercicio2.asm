.data
    # Exercise Header
    Practica:    .word 2
    Ejercicio:    .word 2

    Alumno_1:    .string "Luis Ruiz Moreno"

	# Exercise Data
	str:	.string "lorem ipsum es simplemente el texto de relleno."

.text
begin:
    # print string
    la a0, str
    li a7, 4
    ecall

    mv t0, a0                  # copy the address of the string to t0
    li t2, 97                  # load 97, if is lower than 97 is a space or a upper case
    li t6,46                   # load the '.' character

    loop:
        lb t4, 0(t0)           # charge the first character in t4
        beq t4, zero, end_loop # if t4 is empty-> end_loop
        beq t4,t6,end_loop     # if t4 is '.'-> end_loop
        blt t4, t2, continue   # if t4 is lower than 97 (upper case or space) -> continue
        addi t4, t4, -32       # subtract 32 to convert to upper case
        sb t4, 0(t0)           # save the upper case character

    continue:
        addi t0, t0, 1         # increment the pointer for the next character
        j loop                 # next iteration

    end_loop:
        # print line feed
        li a0, 10
        li a7, 11
        ecall                  # System call

        # print the upper case string
        la a0, str
        li a7, 4
        ecall                  # System call

end:
    li a7, 10
    ecall