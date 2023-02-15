		
	
		AREA bubbleSort,CODE
array 	DCD 12,11,10,9,8,7,6,5,4,3,2,1
size 	DCD 12
		ALIGN
		EXPORT __main
		ENTRY
		
__main	PROC
	
		LDR r5,= array      		;r5 contains the array
		LDR r6,= size
		LDR r6, [r6]
		
		SUB r1,r6,#1				;r1 = i
loop_i	CMP r1,#0
		BLE stop
		
		MOV r0,#1					; r0  == j
		
loop_j	CMP r0,r1
		BGT exit_j					; You don't stop if j>i, just move on to the next array element
		SUB r2,r0,#1				; r2 = j-1
		LDR	r3 , [r5,r2,LSL #2]		;array[j-1] = r5 +r2*4
		LDR r4 , [r5,r0, LSL #2] 	; array[j] = r5 + r2*4
		
		CMP r3,r4					;CMP array[j-1] & array[j]
		STRGT	r4,[r3]
		STRGT 	r3,[r4]
		ADD r0,r0,#1
		B	loop_j
		
		;If j>i decrement i to move to the next element
exit_j	SUB r1,#1			;i--
		B	loop_i
		
stop 	B 	stop
		ENDP
		END