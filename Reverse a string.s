		AREA  reverse_string, CODE
str		DCB		"Reverse me,please!", 0	
		ALIGN
		EXPORT 	__main
		ENTRY
		
__main	PROC 
		LDR r0, =str ;1ST ARGUMENT: POINTER TO STRING
		MOV r1,#0   ;2ND ARGUMENT: start point==0
		MOV r2,#20	;3RD ATGUMENT: END OF STRING
		BL  reverse
stop	B 	stop
		ENDP
			
			
swap 	PROC
		LDRB r2,[r0] ;r0 is the first character of our string. In the c program this line is: temp = *x0
		LDRB r3,[r1] ;r1 is the last character is the last character of the string
		STRB r3,[r0]
		STRB r2,[r1]
		BX lr
		ENDP
			
reverse PROC
		PUSH {r4-r6,lr}
		MOV r6,r0		;STRING POINTER
		MOV r4,r1		;START POSITION
		MOV r5,r2		;END POSITION
			
		;EXIT IF r4 == r5
		CMP r4,r5
		POPEQ {r4-r6,lr}
		
		; Here r0 and r1 are the arguments for the swap function
		ADD r0,r4,r6	;[*str + start]
		ADD r1,r5,r6	;[*str + end]
		BL swap
		
		ADD r4,r4,#1
		SUB r5,r5,#1
		
		MOV	r0,r6
		MOV r1,r4
		MOV r2,r5
		BL reverse
		POP {r4-r6,lr}
		
		ENDP
		END
		
			