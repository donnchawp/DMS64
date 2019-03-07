2 if peek( 52769 ) = 216 or lo = 1 then goto 4: rem CE21 == D8
3 na = 0: lo = 1: load "dmsreader.bin", 8, 1
4 poke 53280, 0: poke 53281, 0: print chr$( 8 ): print "{clr}{white}   dms 64 reader by xeer/ozone"
5 input "source device number(return for 8)"; sd
6 input "dest device number(return for 8)"; dd
7 if sd = 0 then sd = 8: rem source disk
8 if dd = 0 then dd = 8: rem destination disk
9 poke 52748, dd: rem CE03, device for saving to destination disc
10 print "{clr}"
11 sys 52992: rem CF00
12 open 15, sd, 15: rem command channel
13 open 5, sd, 5, "#": rem data channel

14 rem tr: starting disc track to read.
15 rem et: ending disc track to read.
16 rem sc: number of sectors in track.
17 rem sr: current sector being read.
18 rem read tracks from disc, one sector at a time.
20 read tr,et,sc:sr=0
21 if tr = -1 then close 5: close 15: end
30 print#15,"u1";5;0;tr;sr
31 print "reading from disc";
35 sys 53008: rem CF10, read from disc
36 print "{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}track        "; tr
38 print "sector     ";"{left}{left}{left}{left}"; sr
39 print "end track: ";et
40 sr=sr+1:ifsr=scthentr=tr+1:sr=0
45 iftr=(et+1)thensr=0:goto60
46 goto 30
60 close 5: close 15
100 iftr<33thengoto110
101 print "flip dest disc": gosub1000
110 ifsd=ddthenprint"{home}{down}{down}{down}{down}{down}{down}{down}{down}insert dest disk and press space": gosub1000
141 print "{clr}writing up to track ";tr;" sector ";sr;" to disc as ";chr$(na+65);".dms"
130 poke 52800, na+65 : sys 52736: rem CE40, CE00. write to disc
141 print "{clr}wrote up to track ";tr;" sector ";sr;" to disc as ";chr$(na+65);".dms"
140 ifsd=ddthenprint"{down}insert source disk again and press space": gosub1000
145 na=na+1
150 goto 10
190 rem start track, end track, number of sectors in tracks
200 data 1,3,21,4,6,21,7,9,21,10,12,21,13,15,21,16,17,21
210 data 18,19,19,20,22,19,23,24,19
220 data 25,27,18,28,30,18
230 data 31,33,17,34,35,17
240 data -1,-1,-1
1000 if peek ( 56321 ) <> 239 then goto 1000
1010 return
