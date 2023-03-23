.MODEL SMALL
.STACK 100H
.DATA
message db "Number of characters: $"
.MODEL
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    MOV DX, 0
    MOV AH, 1
    INT 21H
    WHILE_:
    CMP AL, 13
    JE EXIT
    INC DX
    INT 21H
    JMP WHILE_
    EXIT:
    MOV BL, DL
    ADD BL, 48
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    MOV AH, 9
    LEA DX, message
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN