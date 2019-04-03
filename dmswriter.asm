!cpu 6502
;
; ---- Code
;
; Load a DMS file
;
*=$ce00
        LDA #$01
        LDX #$09
        LDY #$01
        JSR $FFBA
        LDA #$05
        LDX #$40
        LDY #$CE
        JSR $FFBD
        LDA #$00
        JSR $FFD5
        RTS

*=$ce40
fname: !pet "a.dms"
fname_end:

; Set up pointer to start of memory
*=$cf00
        LDA #$10
        STA $FC
        LDA #$00
        STA $FB
        STA $FF
        RTS

; Write bytes to disk
*=$cf10
        LDX #$05
        JSR $FFC9
        LDY #$00

L_108C: LDX #$36
        STX $01
        LDA ($FB),Y
        STA $0400,Y
        STY $0400
        STY $D020
        LDX #$37
        STX $01
        JSR $FFD2
        INY
        BNE L_108C
        INC $FC
        JSR $FFCC
        RTS
