*=$1000
;
; ---- Code
;
1000: A2 00     LDX #$00
;
L_1002:
1002: BD 20 10  LDA $1020,X
1005: 9D 00 CE  STA $CE00,X
1008: BD 70 10  LDA $1070,X
100B: 9D 00 CF  STA $CF00,X
100E: E8        INX
100F: D0 F1     BNE L_1002
1011: 60        RTS
;
1012: 00        BRK
1013: 00        BRK
1014: 00        BRK
1015: 00        BRK
1016: 00        BRK
1017: 00        BRK
1018: 00        BRK
1019: 00        BRK
101A: 00        BRK
101B: 00        BRK
101C: 00        BRK
101D: 00        BRK
101E: 00        BRK
101F: 00        BRK
1020: A9 01     LDA #$01
1022: A2 09     LDX #$09
1024: A0 01     LDY #$01
1026: 20 BA FF  JSR $FFBA
1029: A9 05     LDA #$05
102B: A2 40     LDX #$40
102D: A0 CE     LDY #$CE
102F: 20 BD FF  JSR $FFBD
1032: A9 00     LDA #$00
1034: 20 D5 FF  JSR $FFD5
1037: 60        RTS
;
1038: 00        BRK
1039: 00        BRK
103A: 00        BRK
103B: 00        BRK
103C: 00        BRK
103D: 00        BRK
103E: 00        BRK
103F: 00        BRK
1040: 00        BRK
1041: 00        BRK
1042: 00        BRK
1043: 00        BRK
1044: 00        BRK
1045: 00        BRK
1046: 00        BRK
1047: 00        BRK
1048: 00        BRK
1049: 00        BRK
104A: 00        BRK
104B: 00        BRK
104C: 00        BRK
104D: 00        BRK
104E: 00        BRK
104F: 00        BRK
1050: 00        BRK
1051: 00        BRK
1052: 00        BRK
1053: 00        BRK
1054: 00        BRK
1055: 00        BRK
1056: 00        BRK
1057: 00        BRK
1058: 00        BRK
1059: 00        BRK
105A: 00        BRK
105B: 00        BRK
105C: 00        BRK
105D: 00        BRK
105E: 00        BRK
105F: 00        BRK
1060: 41 2E     EOR ($2E,X)
1062: 44        ???
1063: 4D 53 00  EOR $0053
1066: 00        BRK
1067: 00        BRK
1068: 00        BRK
1069: 00        BRK
106A: 00        BRK
106B: 00        BRK
106C: 00        BRK
106D: 00        BRK
106E: 00        BRK
106F: 00        BRK
1070: A9 10     LDA #$10
1072: 85 FC     STA $FC
1074: A9 00     LDA #$00
1076: 85 FB     STA $FB
1078: 85 FF     STA $FF
107A: 8D FF CF  STA $CFFF
107D: 60        RTS
;
107E: EA        NOP
107F: EA        NOP
1080: EA        NOP
1081: EA        NOP
1082: EA        NOP
1083: EA        NOP
1084: EA        NOP
1085: A2 05     LDX #$05
1087: 20 C9 FF  JSR $FFC9
108A: A0 00     LDY #$00
;
L_108C:
108C: A2 36     LDX #$36
108E: 86 01     STX $01
1090: B1 FB     LDA ($FB),Y
1092: 99 00 04  STA $0400,Y
1095: 8D 20 D0  STA $D020
1098: A2 37     LDX #$37
109A: 86 01     STX $01
109C: 20 D2 FF  JSR $FFD2
109F: C8        INY
10A0: D0 EA     BNE L_108C
10A2: E6 FC     INC $FC
10A4: EE FF CF  INC $CFFF
10A7: EE 20 D0  INC $D020
10AA: 60        RTS
;
10AB: A9 00     LDA #$00
10AD: 8D FF 03  STA $03FF
10B0: 60        RTS
;
10B1: 00        BRK
10B2: 00        BRK
10B3: 00        BRK
10B4: 00        BRK
10B5: 00        BRK
10B6: 00        BRK
10B7: 00        BRK
10B8: 00        BRK
10B9: 00        BRK
10BA: 00        BRK
10BB: 00        BRK
10BC: 00        BRK
10BD: 00        BRK
10BE: 00        BRK
10BF: 00        BRK
10C0: A2 05     LDX #$05
10C2: 20 C9 FF  JSR $FFC9
10C5: A0 00     LDY #$00
;
L_10C7:
10C7: 8C 64 0F  STY $0F64
10CA: B9 00 64  LDA $6400,Y
10CD: 99 00 04  STA $0400,Y
10D0: 20 D2 FF  JSR $FFD2
10D3: A0 FF     LDY #$FF
10D5: C8        INY
10D6: D0 EF     BNE L_10C7
10D8: 60        RTS
;
10D9: 00        BRK
10DA: 00        BRK
10DB: 00        BRK
10DC: 00        BRK
10DD: 00        BRK
10DE: 00        BRK
10DF: 00        BRK
10E0: 01 00     ORA ($00,X)
10E2: 00        BRK
10E3: 00        BRK
10E4: 00        BRK
10E5: 00        BRK
10E6: 00        BRK
10E7: 00        BRK
10E8: 00        BRK
10E9: 00        BRK
10EA: 00        BRK
10EB: 00        BRK
10EC: 00        BRK
10ED: 00        BRK
10EE: 00        BRK
10EF: 00        BRK
10F0: 00        BRK
10F1: 00        BRK
10F2: 00        BRK
10F3: 00        BRK
10F4: 00        BRK
10F5: 00        BRK
10F6: 00        BRK
10F7: 00        BRK
10F8: 00        BRK
10F9: 00        BRK
10FA: 00        BRK
10FB: 00        BRK
10FC: 00        BRK
10FD: 00        BRK
10FE: 00        BRK
10FF: 00        BRK
