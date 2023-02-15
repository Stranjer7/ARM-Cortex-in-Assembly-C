		AREA myData,DATA
		ALIGN
array	DCD 7,1,7,2,1
		DCD 3,1,2,4,5
		DCD 2,3,2,6,7
		DCD	2,3,2,6,7
			
size 	DCD 20
	
		AREA remove_duplicates, CODE
		EXPORT __main
		ALIGN
		ENTRY
		
__main PROC
	   LDR r0, = array
	   LDR r1,size
	   LDR r1,[r1]
	   ;BL remove_dup
	   
	   ENDP
	   END