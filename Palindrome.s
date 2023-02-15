		AREA myData,DATA
		ALIGN
string 	DCB "rats live on no evil star", 0     ; NULL terminator explicitly added

		AREA palindrome,CODE
		EXPORT __main
		ALIGN
		ENTRY
		
__main 	PROC
		LDR 	r6, = string	; load address of string in r6

		;Find string length
		MOV 	r1,#0	; len		
		MOV 	r5,r6	; load string data from r6 to r5. r5=string
strLen	LDRB 	r2,[r5],#1	;post-index
		CMP 	r2,#0	;Check for NULL character, r2 holds last character
		ADDNE 	r1,r1,#1
		BNE  	strLen
		
		;Check palindrome
		SUB 	r1,r1,#1	;len - 1
		ADD		r1,r6,r1	;&str[len-1]. Address of last character is string's first character plus length of string - 1
		MOV 	r2,r6		;&str. First character of string
		
cmpStr	LDRB 	r3,[r2],#1 ;Len - 1
		LDRB 	r4,[r1],#-1 ;str[len - 1 - i]
		CMP 	r3,r4
		MOVNE	r0,#0 	;set flag
		BNE		stop
		CMP 	r1,r2
		BLT 	cmpStr
		
		MOV 	r0,#1
		
stop	B 		stop	
		ENDP
		END
		