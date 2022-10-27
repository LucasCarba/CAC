.data
A: .word 0
B: .word 0
C: .word 0
RES: .word 0 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
.code
LWU $s0,DATA($0)
LWU $s1,CONTROL($0)

DADDI $t1,$0,6 
SD $t1,0($s1)

DADDI $t0,$0,8
SD $t0, 0($s0)
LD $t5,0($s1)
SD $t5, A($R0)

DADDI $t0,$0,8
SD $t0, 0($s0)
LD $t6,0($s1)
SD $t6, B($R0)

DADDI $t0,$0,8
SD $t0, 0($s0)
LD $t7,0($s1)
SD $t7, C($R0)

JAL ELEVADO

LD $t4, RES($0)
SD $t0,0($s0)
DADDI $t0,$0,2
SD $t0,0($s1) 
halt

ELEVADO: LD $t4,A($0)
LD $t5,B($0)
LD $t6,C($0)
DADD $t4,$t4,$t5
LOOP: DADDI $t6,$t6,-1 
DMUL $t4,$t4,$t4
BNEZ $t6, LOOP
SD $t4,RES($0)
JR $ra