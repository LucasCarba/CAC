; Memoria de datos
ORG 1000H
NUM1 DW 5H ; NUM1 y NUM2 deben ser mayores que cero
NUM2 DW 3H
; Memoria de Instrucciones
ORG 3000H ; Subrutina MUL
MUL: MOV DX, 0 
LAZO: MOV BX, AX 
ADD DX, [BX] 
PUSH DX 
MOV BX, CX 
MOV DX, [BX]
DEC DX
MOV [BX], DX
POP DX
JNZ LAZO
RET

ORG 2000H ; Programa principal
MOV AX, OFFSET NUM1
MOV CX, OFFSET NUM2
CALL MUL
HLT
END
