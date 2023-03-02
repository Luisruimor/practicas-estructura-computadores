.data
    
# Exercise Header
    Practica:    .word 1
    Ejercicio:    .word 2
    
    Alumno_1:    .string "Luis_Ruiz_Moreno"

# Exercise data
    # Variables to operate
    A:    .word 5
    B:    .word 3
    C:    .word 2
    D:    .word 2
    F:    .word 0

.text
begin:
    lw t3,A
    lw t4,B
    add t5,t3,t4    # Adds A+B and store in t5
    
    lw t3,C
    lw t4,D
    add,t6,t3,t4    # Adds C+D and store in t6

    lw,a0,F
    sub a0,t5,t6    # Calculates F and store in a0
    
    li a7,1    # System Call -> PrintInt
    ecall
   
end:
    li a7,10
    ecall