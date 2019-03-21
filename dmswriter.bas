7 ifpeek(52757)=213then lo=4:rem ce15,d5
8 iflo=4thengoto10:
9 lo=4:load"dmswrite.asm",8,1
10 poke53280,0:poke53281,0:print"{clr}{white}dms 64 write by xeer/ozone"
11 input"source device number(return for 8)";sd
12 input"dest device number(return for 8)";dd
13 print"insert source disk and press space":gosub3000
14 ifsd=0thensd=8:ifdd=0thendd=8:
15 na=0:sr=-1:poke52739,sd:gosub1000:poke52800,na+65:sys52992:rem ce03,ce40,cf00
16 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}if the disk stops in one disk mode,"
17 print"swap disks and press space!"
18 print"if the screen flashes then u must use side 2 of the destination disk"
20 open15,dd,15:open5,dd,5,"#":read tr,et,sc:iftr=-1thengoto50
30 print#15,"u2";5;0;tr;sr
31 print#15,"b-p";5;0
32 sys53008:rem cf10
40 sr=sr+1:ifsr=scthentr=tr+1:sr=0
41 iftr=(et+1)thensr=0:goto60
46 goto30
50 print"finished!":close5:close15:end
60 close5:close15
100 sr=-1:sd=8:gosub1000
110 na=na+1:poke52800,na+65:rem ce40
115 if peek(52800)=76 then gosub4000:rem ce40
120 gosub1000:sys52992:rem cf00
140 goto20:
200 data 1,3,21,4,6,21,7,9,21,10,12,21,13,15,21,16,17,21
210 data 18,19,19,20,22,19,23,24,19
220 data 25,27,18,28,30,18
230 data 31,33,17,34,35,17
240 data -1,-1,-1
1000 ifsd=ddthengosub3000
1005 sys52736:rem ce00
1010 ifsd=ddthengosub3000
1020 return
3000 ifpeek(56321)<>239then3000:rem press space
3005 return
4000 poke53280,peek(53280)+1:poke53280,peek(53280)-1:rem flash screen and hit space.
4004 ifpeek(56321)<>239then4000
4005 return
