HAND EQU 40H
ORG 1000H
MSJ DB "INGRESE NUMERO:"
FIN DB ?
NUM DB ?

ORG 2000H
IN AL, HAND+1
AND AL, 7FH
OUT HAND+1, AL

MOV CX, NUM
INGRESAR: MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
MOV BX, CX
INT 6
INC DL
INC CX
CMP DL, 5
JNZ INGRESAR
MOV BX, NUM
POLL: IN AL, HAND+1
AND AL, 1
JNZ POLL
MOV AL, [BX]
OUT HAND, AL
INC BX
INC DH
CMP DH, 5
JZ FINAL
JNZ POLL
FINAL: INT 0
END
