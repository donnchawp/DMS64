!cpu 6502
;!to "build/dmsreader",cbm    ; output file
;
; ---- Code
;
; We're going to use kernal functions to read/write to disk.
; http://sta.c64.org/cbm64krnfunc.html
; http://codebase64.org/doku.php?id=base:saving_a_file
*=$CE00
; Write data to a file call X.DMS where X is A->Z
; The filename is stored in #CE40.
; Line 130 of the BASIC loader increments the filename.
; SETLFS. Set file parameters.
; Input: A = Logical number; X = Device number; Y = Secondary address.

file_start = $1000

; SETNAM. Set file name parameters.
; Input: A = File name length; X/Y = Pointer to file name.
        LDA #fname_end-fname
        LDX #<fname
        LDY #>fname
        JSR $FFBD     ; SETNAM
        LDA #$00
        LDX #$08
        LDY #$00
        JSR $FFBA ; SETLFS

; SAVE. Save file. (Must call SETLFS and SETNAM beforehands.)
; Input: A = Address of zero page register holding start address of memory area to save; X/Y = End address of memory area plus 1.
; Output: Carry: 0 = No errors, 1 = Error; A = KERNAL error code (if Carry = 1).
; Used registers: A, X, Y.
        LDA #$00
        STA $FD
        LDA #$10
        STA $FE

        LDA #$FD
        LDX #$01
        LDY $FC
        STY $D020
        JSR $FFD8
        BCS .error
        RTS
.error
        ; Akkumulator contains BASIC error code
        RTS

; name used to save the DMS files.
*=$CE40
fname: !pet "a.dms"
fname_end:
; !byte $4d, $2e, $44, $4d, $53, $00

; http://codebase64.org/doku.php?id=base:reading_a_sector_from_disk
; READ FROM DISC INTO MEMORY
*=$CF00
        LDA #$10
        STA $FC
        LDA #$00
        STA $FB
        STA $FF
        RTS

*=$CF10
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
L_108C: JSR $FFCF
        LDX #$36 ; 0011 0110
        STX $01 ; Turn off all ROMs http://sta.c64.org/cbm64mem.html
        STA ($FB),Y
        STA $0400,Y
        STY $0400
        STY $D020
        LDX #$37 ; Turn ROMs on again.
        STX $01
        INY
        BNE L_108C
        INC $FC
        LDA #$00
        STA $D020
        JSR $FFCC
        RTS
