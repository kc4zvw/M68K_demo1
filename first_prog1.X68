*-----------------------------------------------------------
* Title      : First_prog1.x86
* Written by : David Billsbrough
* E-mail     : dbillsbrough@gmail.com
* Date       : 20-Nov-2023
* Description: Just playing around
*-----------------------------------------------------------

        ORG     $1000
START:                  ; first instruction of program

        MOVEQ   #3,D0
        LEA     addr1,A0
        MOVE    D0,(A0)

        MOVEQ   #5,D0
        LEA     addr2,A0
        MOVE    D0,(A0)
    
        LEA     addr1, A0
        MOVE    (a0), D2
        ADD.w   D0, D2
        LEA     addr3,A0
        MOVE    D2,(A0)
        
        MOVEQ   #6,D0                   ; Subtraction Testing
        LEA     addr4,A0
        MOVE    D0,(A0)

        MOVEQ   #3,D0
        LEA     addr5,A0
        MOVE    D0,(A0)

        LEA     addr4,A0
        MOVE    (A0),D2
        SUB.w   D0,D2
        LEA     addr6,A0
        MOVE    D2,(A0)

        MOVEQ   #4,D0                   ; Multiplication Testing
        LEA     addr7,A0
        MOVE    D0,(A0)

        MOVEQ   #3,D0
        LEA     addr8,A0
        MOVE    D0,(A0)

        LEA     addr7,A0
        MOVE    (A0),D2
        MULS.w  D0,D2
        LEA     addr9,A0
        MOVE    D2,(A0)

        MOVEQ   #12,D0                  ; Division Testing
        LEA     addr10,A0
        MOVE    D0,(A0)

        MOVEQ   #3,D0
        LEA     addr11,A0
        MOVE    D0,(A0)

        LEA     addr10,A0
        MOVE    (A0),D2
        DIVS.w  D0,D2
        LEA     addr12,A0
        MOVE    D2,(A0)

	MOVE.B	#81,D0
	MOVE.L	#$0000FF00,D1
	TRAP	#15
        MOVE    #14,D0                  ; D0 = task number 14.
        LEA     results,A1              ; A1 = address of string to display.
        TRAP    #15                     ; Activate input/output task.

        BRA     Quit
        
        SIMHALT                 ; halt simulator
        
        ORG     $3000

* Put variables and constants here

;       SECTION DATA
        
addr1   DC.W    0               ; the summands of the addition
addr2   DC.W    0               ; the second summands
addr3   DC.W    0               ; the sum

addr4   DC.W    0               ; the minuend of the subtraction
addr5   DC.W    0               ; the subtrahend
addr6   DC.W    0               ; the difference

addr7   DC.W    0               ; the multiplier of the multipication
addr8   DC.W    0               ; the multiplican
addr9   DC.W    0               ; the product

addr10  DC.W    0               ; the dividend of the division
addr11  DC.W    0               ; the divisor
addr12  DC.W    0               ; the quotient
        
results DC.B    'The answer is '
        DC.W    addr12
        DC.B    '.',13,10,0

Quit:

        END     START           ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~

* **** End of File ****


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
