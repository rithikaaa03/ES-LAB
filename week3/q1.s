 		AREA RESET,DATA,READONLY
		EXPORT __Vectors
__Vectors
		DCD 0x10001000
		DCD Reset_Handler
		ALIGN
		AREA mycode,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
		LDR R0, =NUM
		LDR R1, =DEN
		LDR R5, =RES
		MOV R2,#0
		LDR R3,[R0]
		LDR R4,[R1]	
UP		CMP R3,R4
		BCC STORE
		SUBS R3,R3,R4
		ADD R2,#1
		B UP
STORE 	STR R2,[R5],#4
		STR R3,[R5]
STOP 	B STOP		
NUM DCD 10
DEN DCD 3
	AREA mydata,DATA,READWRITE
RES DCD 0
		END