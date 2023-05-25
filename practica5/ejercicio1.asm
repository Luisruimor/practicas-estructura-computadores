.data
n:    .word 7

.text
lw a0, n    # call procedure
jal ra,fact

li a7,1    # print result
ecall

li a7,10    # exit
ecall

#------------------------------------------------------------
fact:   # a0 : n
        # a1 : return value
        # function: powers of 1 (exp=[1,n-1])
#------------------------------------------------------------
        blez    a0, LBB0_4
        neg     a1, a0
        li      a2, 1
        li      a0, 1
        li      a3, 1
LBB0_2:
        xor     a0, a0, a3
        addi    a3, a3, 1
        add     a4, a1, a3
        bne     a4, a2, LBB0_2
        ret
LBB0_4:
        li      a0, 1         # return 1
        ret