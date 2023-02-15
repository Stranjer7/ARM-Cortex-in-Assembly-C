		AREA factorial,CODE,READONLY
		EXPORT __main
		ENTRY
		
__main	PROC
		
		MOV r0,#1		
		MOV r1,#1		
		MOV r2,#6
		LDR r5,=0x34
		
loop 	CMP r1,r2 
		BGT stop
		MUL r0,r0,r1
		ADD  r1,r1,#1
		B loop
		
stop 	B stop		
		ENDP
		END
			

		