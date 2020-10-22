     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
	MOV R0, #1 ; power of X
	
	MOV R3, #2 ;  TO CHECK WHETHER POWER IS EVEN OR NOT
	VLDR.F32 s1, = 4 ; THIS FP REG S1 IS USED TO LOAD VALUE OF X OF LOG(1+X)
	VLDR.F32 s3, = 1 ;
	VLDR.F32 S5, = 0 ; THIS FP REG S5 WILL DISPLAY THE RESULT
	;MOV R8, #1 ; To add 1 to register
	MOV R9, #25 ; Number of iterations
mult_	  VMUL.F32 s3,s3,s1 	
		  

pow  udiv r4,r0,r3
	 mls  r4,r4,r3,r0
	 cmp r4, #0 
	 vmov s0,R0
	 VCVT.F32.u32 s0,s0 ; converting s0 to Floating point 
	 VDIV.F32 s4,s3,s0
	 beq even			
    
	 VADD.F32 s5,s5,s4 ; adding when power is odd 
	 b iter
	 
	 
even VSUB.F32 s5,s5,s4 ; subtracting when power is even 
	 

	 	
 
iter ADD R0,R0, #1
	 SUB R9,R9, #1
	 CMP R9, #0
	 BNE mult_
	 
	 
stop	B stop; stop program	 
		 
     ENDFUNC
     END