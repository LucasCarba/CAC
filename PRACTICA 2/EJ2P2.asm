
IMPRIME TODAS LAS LETRAS DEL ABECEDARIO
ORG 1000H
CADENA DB ?
ORG 2000H
MOV BX, OFFSET CADENA
MOV AL,1
MOV CX, 40H
MOV [BX], CX
MOV CL,[BX]
LOOP: INC CL
MOV [BX], CL
INT 7
CMP CL, 7BH
JNZ LOOP
INT 0
END


