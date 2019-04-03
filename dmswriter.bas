10 ifpeek(52757)=213then 40:rem ce15,d5
30 load"dmswriter.bin",8,1
40 poke53280,0:poke53281,0:print"{clr}{white}dms 64 write by xeer/ozone"
50 input"source device number(return for 8)";sd
60 input"dest device number(return for 8)";dd
70 ifsd=0thensd=8
80 ifdd=0thendd=8
90 na=0:sr=0:di$="side 1"
100 gosub3000:rem prompt for source disk
110 gosub 4100:rem position on the screen
120 print"if the disk stops in one disk mode,swap disks and press space!"
130 print"if the screen flashes then you must use side 2 of the destination disk"
131 ifsd=ddthengosub3000:rem prompt for source disk.
133 print "{clr}":gosub 4100:print "reading a.dms";
140 poke52739,sd:rem ce03, source disk
150 sys52736:rem ce00, read a dms file
160 poke52800,na+65:rem ce40, a.dms
170 sys52992:rem cf00, set up for writing
171 ifsd=ddthengosub4000:rem prompt to enter destination disk
180 open15,dd,15:rem command channel
190 open5,dd,5,"#":rem data channel
200 read tr,et,sc
210 iftr=-1thengoto280
220 print#15,"u2";5;0;tr;sr
221 ifsr=0thenprint"{clr}"
222 gosub 4100:print"writing to track ";tr;" sector ";sr;"   "
240 sys53008:rem cf10 write a sector
250 sr=sr+1:ifsr=scthentr=tr+1:sr=0
260 iftr=(et+1)then goto300:rem finished writing current group of tracks
270 goto220
280 close5:close15
290 print"finished!":end
300 close5:close15:rem finished writing, insert src disk
310 sr=0
320 na=na+1:poke52800,na+65:rem ce40
330 if peek(52800)=76 then di$="side 2":gosub3000:goto340:rem ce40, side 2
331 ifsd=ddthengosub3000
340 gosub 1000:rem read in next dms file
340 sys52992:rem cf00
341 ifsd=ddthengosub4000
350 goto180
360 data 1,3,21,4,6,21,7,9,21,10,12,21,13,15,21,16,17,21
370 data 18,19,19,20,22,19,23,24,19
380 data 25,27,18,28,30,18
390 data 31,33,17,34,35,17
400 data -1,-1,-1
1000 gosub 4100:rem position on the screen
1001 print "{down}{down}{down}reading ";chr$(na+65);".dms"
1005 sys52736:rem ce00. read a dms file.
1020 return
3000 print "{clr}":gosub 4100:print "insert ";di$;" of source disk in drive ";sd;" and press space"
3001 ifpeek(56321)<>239then3001:rem press space
3005 return
4000 gosub 4100:print "insert destination disk in drive ";dd;" and press space"
4001 poke53280,peek(53280)+1:poke53280,peek(53280)-1:rem flash screen and hit space.
4004 ifpeek(56321)<>239then4001
4005 return
4100 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
4105 return
