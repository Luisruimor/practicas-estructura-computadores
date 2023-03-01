.data
    
# Exercise Header
    Practica:    .word 1
    Ejercicio:    .word 1
    Apartado:    .string "a"
    
    Alumno_1:    .string "Luis_Ruiz_Moreno"

# Exercise data
    str1:    .string "39steps"

.text
begin:
    la a0,str1    # Load into a0 the address of str1
    
    li a7,4    # Load 4 in a7, to print
    ecall    # System Call -> PrintString
end:
    li a7,10
    ecall