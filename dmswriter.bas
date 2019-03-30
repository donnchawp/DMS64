10 ifpeek(52757)=213then 40:rem ce15,d5
30 load"dmswrite.asm",8,1
40 poke53280,0:poke53281,0:print"{clr}{white}dms 64 write by xeer/ozone"
50 input"source device number(return for 8)";sd
60 input"dest device number(return for 8)";dd
70 print"insert source disk and press space":gosub3000
80 ifsd=0thensd=8
90 ifdd=0thendd=8
100 na=0:sr=-1
110 poke52739,sd:rem ce03, source disk
120 sys52736:rem ce00, read a dms file
130 poke52800,na+65:rem ce40, a.dms
140 sys52992:rem cf00, set up for writing
150 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
160 print"if the disk stops in one disk mode,swap disks and press space!"
170 print"if the screen flashes then you must use side 2 of the destination disk"
180 open15,dd,15:rem command channel
190 open5,dd,5,"#":rem data channel
200 read tr,et,sc
210 iftr=-1thengoto280
220 print#15,"u2";5;0;tr;sr
230 rem print#15,"b-p";5;0
240 sys53008:rem cf10 write a sector
250 sr=sr+1:ifsr=scthentr=tr+1:sr=0
260 iftr=(et+1)thensr=0:goto300
270 goto220
280 close5:close15
290 print"finished!":end
300 close5:close15
310 sr=-1:gosub1000
320 na=na+1:poke52800,na+65:rem ce40
330 if peek(52800)=76 then gosub4000:rem ce40
340 gosub1000:sys52992:rem cf00
350 goto180
360 data 1,3,21,4,6,21,7,9,21,10,12,21,13,15,21,16,17,21
370 data 18,19,19,20,22,19,23,24,19
380 data 25,27,18,28,30,18
390 data 31,33,17,34,35,17
400 data -1,-1,-1
1000 ifsd=ddthengosub3000
1005 sys52736:rem ce00. read a dms file.
1010 ifsd=ddthengosub3000
1020 return
3000 ifpeek(56321)<>239then3000:rem press space
3005 return
4000 poke53280,peek(53280)+1:poke53280,peek(53280)-1:rem flash screen and hit space.
4004 ifpeek(56321)<>239then4000
4005 return
