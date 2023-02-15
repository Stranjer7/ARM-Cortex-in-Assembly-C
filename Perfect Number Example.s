		AREA PerfectNumber,CODE
		EXPORT __main
		ALIGN
		ENTRY
		
__main	PROC
		MOV   r1,#28	;Num
		MOV   r2,#0  ;Sum
		
		MOV   r3, #1 ;i index
loop	CMP   r3,r1  ;i<Num
		
		;CMP r3, rl" updates the N, Z, C, and V flags based on the results of subtraction r3 - rl.
		;The following BHS (Branch if unsigned higher or same) instruction checks the C flag. 
		;Also,BHS causes PC to branch away if the C flag is set, indicating that no borrowing has occurred uring the subtraction.
		BHS check  
		
		;UDIV + MLS equal num%i in c
		UDIV  r4,r1,r3 		;r4= num/i
		MLS   r4,r3,r4,r1 	;r4=num - i*r4
		CMP   r4,#0
		ADDEQ r2,r2,r3     ;Increment sum
		ADD   r3,r3,#1
		B 	  loop
		
check 	CMP   r2,r1
yes		MOVEQ r0,#1			;Update flag if sum=num
no		MOVNE r0,#0

stop 	B 	  stop
		ENDP
		END