!cpu 6502
;!to "build/dmsreader",cbm    ; output file
*=$CE00
;
; ---- Code
;
; We're going to use kernal functions to read/write to disk.
; http://sta.c64.org/cbm64krnfunc.html
*=$CE00
; SETLFS. Set file parameters.
; Input: A = Logical number; X = Device number; Y = Secondary address.
LDA #$01
LDX #$08
LDY #$01
JSR $FFBA
; SETNAM. Set file name parameters.
; Input: A = File name length; X/Y = Pointer to file name.
LDA #$05
LDX #$40
LDY #$CE
JSR $FFBD
; SAVE. Save file. (Must call SETLFS and SETNAM beforehands.)
; Input: A = Address of zero page register holding start address of memory area to save; X/Y = End address of memory area plus 1.
; Output: Carry: 0 = No errors, 1 = Error; A = KERNAL error code (if Carry = 1).
; Used registers: A, X, Y.
LDA #$00
STA $FD
LDA #$10
STA $FE
LDA #$FD
LDX #$00
LDY $FC
JSR $FFD8
RTS

; name used to save the DMS files.
*=$CE40
!byte $4d, $2e, $44, $4d, $53, $00

*=$CF00
LDA #$10
STA $FC
LDA #$00
STA $FB
STA $FF
RTS

NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP

; Open channel 5 for reading, and then read data from it.
; Use indirect indexed addressing (https://www.c64-wiki.com/wiki/Indirect-indexed_addressing)
; to write data to $1000 onwards, through the locations $FB/$FC.
; At the end of the loop we have written 255 bytes so increment $FC
; Turn off BASIC and other ROMs to write data to RAM.
; It also writes the data to the screen at $0400,Y to show progress.
; CHKIN. Define file as default input. (Must call OPEN beforehands.)
; Input: X = Logical number.
LDX #$05
JSR $FFC6
; CHRIN. Read byte from default input (for keyboard, read a line from the screen). (If not keyboard, must call OPEN and CHKIN beforehands.)
; Input: –
; Output: A = Byte read.
; Used registers: A, Y.
LDY #$00
L_108C:
JSR $FFCF
LDX #$36 ; 0011 0110
STX $01 ; Turn off all ROMs http://sta.c64.org/cbm64mem.html
STA ($FB),Y
STA $0400,Y
LDX #$37 ; Turn ROMs on again.
STX $01
INY
BNE L_108C
INC $FC
RTS

NOP
STA $03FF
RTS

BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
BRK
; CHKOUT. Define file as default output. (Must call OPEN beforehands.)
; Input: X = Logical number.
LDX #$05
JSR $FFC9
LDY #$00

L_10C7:
STY $0F64
LDA $6400,Y
STA $0400,Y
; CHROUT. Write byte to default output. (If not screen, must call OPEN and CHKOUT beforehands.)
; Input: A = Byte to write.
JSR $FFD2
LDY #$FF
INY
BNE L_10C7
RTS

BRK
BRK
BRK
BRK
BRK
BRK
BRK
ORA ($00,X)
BRK
