// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// if (R0 = 0) goto zero
	@R0
	D = M
	@0
	D = D+A		
	@zero
	D;JEQ

// if (R1 = 0) goto zero
	@R1
	D = M
	@0
	D = D+A		
	@zero
	D;JEQ

// R3 <- 0
	@R3
	M = 0
	
// R0 * R1
	(mult)
	@R0			
	D = M
	@R3
	M = D+M		// R3 <- R0
	@R1
	MD = M-1	// M <- (R1-1) and D <- (R1-1)
	@result
	D;JEQ
	@mult
	0;JMP
	
// R2 <- result
	(result)
	@R3
	D = M
	@R2
	M = D
	@end
	0;JMP
	
// zero
	(zero)
	@R2
	M = 0
	@end
	0;JMP

// end
(end)
