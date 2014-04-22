// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// initialisation
	@8191
	D = A
	@R4
	M = D
	
// R5 <- current address
	(address)
	@R4
	D = M
	@SCREEN
	D = D + A
	@R5
	M = D
	
// I/O testing
	(io)
	@KBD
	D = M
	@white
	D;JEQ
	@black
	0;JMP
	
// cell coloring

	(black)
	D = -1
	@coloring
	0;JMP
	
	(white)
	D = 0
	@coloring
	0;JMP
	
	(coloring)
	@R5
	A = M
	M = D
	
// next cell
	
	@R4
	D = M
	@last
	D;JEQ
	@default
	0;JMP
	
	(last)
	@8192
	D = A
	@R4
	M = D
	
	(default)
	@R4
	M = M-1
	@address
	0;JMP