		AREA myData,DATA
		ALIGN
str1 	DCB	"Shacking",0
str1_	SPACE 20			;Reserve 20 bytes for string1
str2	DCB  "Hands",0


		AREA my_strcat,CODE
		EXPORT __main
		ALIGN
		ENTRY
		
__main 	PROC
		
		LDR r0,=str1
		LDR r1,=str2
		BL	strcat
stop	B	stop
		ENDP
			
			
strcat	PROC
loop	LDRB	r2, [r0]	;load a byte
		CBZ		r2, copy
		ADD		r0,r0,#1
		B		loop
		
copy	LDRB 	r3,[r1],#1	;Post-index
		STRB	r3,[r0],#1
		CBNZ	r3,copy
		
		BX 		lr
		
		ENDP
		END