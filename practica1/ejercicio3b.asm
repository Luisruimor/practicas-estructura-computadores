.data
    
    # Exercise Header
    Practica:    .word 1
    Ejercicio:    .word 3
    Apartado:    .string "b"
    
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
    
    div t5,t3,t4    # Calculate quotient
    mul,t6,t4,t5    # Multiplicate quotient by divisor

    lw a0,R
    sub,a0,t3,t6    # Calculate the remainder (dividend-t6)
    
    li a7,2    # System Call -> PrintFloat
    ecall
end:
    li a7,10
    ecall