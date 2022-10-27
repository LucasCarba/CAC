PIO EQU 30H
TIMER EQU 10H
PA EQU 31H
CA EQU 33H
PIC EQU 20H
IMR EQU 21H ; ENMASCARA INTERRUPCIONES CON 1
TIMER_PIC EQU 25H
N_CLK EQU 10 ;  IP_CLK = N_CLK*4

ORG 40
IP_CLK DW RUT_CLK

ORG 1000H
L0 DB 00000001B
L1 DB 00000010B
L2 DB 00000100B
L3 DB 00001000B
L4 DB 00010000B
L5 DB 00100000B
L6 DB 01000000B
L7 DB 10000000B

ORG 2000H
CLI
MOV AL, 0H
OUT CA, AL
MOV AL, L0
OUT PA, AL
MOV AL, 11111101B
OUT IMR, AL
MOV AL, N_CLK
OUT TIMER_PIC,AL
MOV AL,10
OUT TIMER+1,AL
STI
MOV BX,OFFSET L0
MOV DH,1 ; SENTIDO 1 IZQUIERDA 0 DERECHA
LAZO: JMP LAZO

ORG 3000H
RUT_CLK: CMP DH,1
		 JNZ DERECHA
IZQUIERDA: 	INC BX
			MOV AL,[BX]
			OUT PA,AL
			CMP BX, OFFSET L7
			JNZ FIN
			MOV DH,0
			JMP FIN
DERECHA: DEC BX
		 MOV AL,[BX]
		 OUT PA,AL
		 CMP BX,OFFSET L0
		 JNZ FIN
		 MOV DH,1
FIN:MOV AL,0 
	OUT TIMER,AL
	MOV AL,PIC
	OUT PIC, AL
	IRET
END
