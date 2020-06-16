        ORG 8000H

		MVI A,80H
		OUT 10H
        MVI A,0EH
        SIM
        EI
START:  MVI B,00H
READ:   MVI A,0EH
        SIM
		PUSH B
        CALL 0133H
		PUSH PSW
		JMP SOUND
		
CORR:   POP PSW
		POP B
		CPI 17H
        JZ FIN
        MOV C,A
        MOV A,B
        RLC
        RLC
        RLC
        RLC
        ANI F0H
        ORA C
        MOV B,A
        PUSH B
        CALL 0109H
        CALL DELAY
        POP B
        JMP READ


FIN:    MVI D,00H
        MOV C,B
RAND:   MOV A,B
        RLC
        RLC
        RLC
        XRA B
        RLC
        RLC
        RLC
        XRA B
        CMA
        RLC
        MOV A,B
        RAL
        MOV B,A
        INR D
        CMP C
        JZ TELOS
        PUSH D
        PUSH B
        CALL 0109H
        POP B
        POP D
        JMP RAND

TELOS:  MOV A,D
        CALL 0109H
        CALL DELAY
        JMP START

DELAY:  MVI A,03H
LOOP1:  MVI B,FFH
LOOP2:  MVI C,FFH
LOOP3:  DCR C
        JNZ LOOP3
        DCR B
        JNZ LOOP2
        DCR A
        JNZ LOOP1
        RET

SOUND:	CPI 17H
		JZ SOSTO
		CPI 10H
		JC SOSTO
		JMP LATHOS
		
		
		
		
		
		
SOSTO:	LXI D,300D
BACK11:	CALL 1KHZ
		DCX D
		MOV A,D
		CPI 00H
		JNZ BACK11
BACK12: CALL 1KHZ
		DCX D
		MOV A,E
		CPI 00H
		JNZ BACK12
		JMP CORR
		
1KHZ:	MVI A,11000000B
		SIM
		CALL DELAY1
		MVI A,01000000B
		SIM
		CALL DELAY1
		RET
		
DELAY1:	MVI A,100D
LOOP11:	DCR A
		JNZ LOOP11
		RET
		
		
		
		
		
		
LATHOS:	LXI D,600D
BACK21:	CALL 2KHZ
		DCX D
		MOV A,D
		CPI 00H
		JNZ BACK21
BACK22: CALL 2KHZ
		DCX D
		MOV A,E
		CPI 00H
		JNZ BACK22
		POP PSW
		JMP READ
		
2KHZ:	MVI A,11000000B
		SIM
		CALL DELAY2
		MVI A,01000000B
		SIM
		CALL DELAY2
		RET

DELAY2:	MVI A,50D
LOOP22:	DCR A
		JNZ LOOP22
		RET		
		
        END
