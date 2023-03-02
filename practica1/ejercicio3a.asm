.data
    
    # Exercise Header
    Practica:    .word 1
    Ejercicio:    .word 3
    Apartado:    .string "a"
    
    Alumno_1:    .string "Luis_Ruiz_Moreno"
    
    # Exercise data
    A:    .word 24
    B:    .word 6
    R:    .word 0
.text
begin:
    # First, load variables A and B
    lw t3,A
    lw t4,B

    lw a0,R    # Load the address of the variable R
    rem a0,t3,t4    # Calculate the remainder of A/B and store in a0
    
    li a7,2    # System Call -> PrintFloat
    ecall
end:
    li a7,10
    ecall