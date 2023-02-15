		AREA myData,DATA
		ALIGN


		AREA BinarySearch,CODE
array	DCD	 11,12,13,14,15,16
size	DCD	 6
		EXPORT	__main
		ALIGN
		ENTRY

		
__main	PROC
		MOVS r3,#12	;target
		MOVS r5,#-1	;target location
		LDR  r12,=array
		MOVS r1,#0	;left
		
		LDR  r2,=size
		LDR  r2,[r2]
		SUB	 r2,r2,#1  ;right
		
loop	ADD  r0,r1,r2  ;left+right
		LSR	 r0,r0,#1	; middle = (left+right)/2
		LDR  r4,[r12,r0,LSL#2]	;array[middle]
		
		CMP  r4,r3 ;If middle == target
		SUBGT r2,r0,#1
		ADDLT r1,r0,#1
		BEQ  found
		
		CMP r1,r2
		BLE  loop
found	MOVEQ r5,r0

stop	B stop
		
		ENDP
		END
		
