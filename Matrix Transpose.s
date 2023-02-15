		AREA Transpose,CODE
		ALIGN
		EXPORT __main
matrix	DCD 1,2,3,4,5,6,7,8,9
		ENTRY
		
__main	PROC
		LDR r0, =matrix
		BL transp
stop	B	stop		
		ENDP
			
transp	PROC
		PUSH {r4-r7,lr}
		MOV r1,#0			;r1 = i
loop_i	CMP r1,#3
		BGE exit_i
		ADD r2,r1,#1			;r2 = j=i+1
loop_j	CMP r2,#3	
		BGE exit_j
		
		;r4= p + (3*i + j)*4 , This moves to the next array element which is 4 bytes away
		ADD r4,r1,r1,LSL#1	;r4 = r1 + r1*2 = 3*i
		ADD r4,r0,r4,LSL#2	; r4 = R4*4  
		ADD r4,r2,LSL#2
		
		;r5= p + (3*j + i)*4 , This moves to the next array element which is 4 bytes away
		ADD r5,r2,r2,LSL#1	;r4 = r1 + r1*2 = 3*i
		ADD r5,r0,r5,LSL#2	; r4 = R4*4  
		ADD r5,r1,LSL#2
		
		;swap elements
		LDR r6,[r4]
		LDR r7,[r5]
		STR r7,[r4]
		STR r6,[r5]
		
		ADD r2,r2,#1
		B loop_j
			
exit_j  ADD r1,r1,#1
		B loop_i


exit_i	POP {r4-r7,lr}
		ENDP
		END
		
