10 ifpeek(52736)=169then 40:rem ce15,d5
30 load"dmswriter.bin",8,1
40 poke53280,0:poke53281,0:print"{clr}{white}dms 64 write by xeer/ozone"
50 input"source device number(return for 8)";sd
60 input"dest device number(return for 8)";dd
70 ifsd=0thensd=8
80 ifdd=0thendd=8
90 na=0:sr=0:di$="side 1"
100 gosub3000:rem prompt for source disk
140 poke52739,sd:rem ce03, source disk

150 poke52800,na+65:rem ce40, X.dms
160 gosub 4100:print "{down}{down}{down}reading ";chr$(na+65);".dms"
162 sys52736:rem ce00. read a dms file.
163 ifsd=ddthengosub4000:rem prompt to enter destination disk
170 sys52992:rem cf00, set up for writing
180 open5,dd,5,"#":rem data channel
190 open15,dd,15,"b-p 5 0":rem command channel
200 read tr,et,sc
210 iftr=-1thengoto280
220 ifsr=0thenprint"{clr}"
230 gosub 4100:print chr$(na+65);".dms: writing to track ";tr;" sector ";sr;"   "
240 sys53008:rem cf10 write a sector
241 print#15,"u2 5 0 ";tr;sr
250 sr=sr+1:ifsr=scthentr=tr+1:sr=0
255 ifna=13thengoto280: rem finished writing m.dms
260 iftr=(et+1)then goto300:rem finished writing current group of tracks
270 goto220
280 close5:close15
290 print"finished!":end
300 close5:close15:rem finished writing, insert src disk
310 sr=0
320 na=na+1
330 if na=11 then di$="side 2":gosub3000:goto350:rem ce40, side 2
340 ifsd=ddthengosub3000
350 goto150

360 data 1,3,21,4,6,21,7,9,21,10,12,21,13,15,21,16,17,21
370 data 18,19,19,20,22,19,23,24,19
380 data 25,27,18,28,30,18
390 data 31,33,17,34,35,17
400 data -1,-1,-1
3000 print "{clr}":gosub 4100:print "insert ";di$;" of source disk in drive ";sd;" and press space"
3001 ifpeek(56321)<>239then3001:rem press space
3005 return
4000 gosub 4100:print "insert destination disk in drive ";dd;" and press space"
4001 poke53280,peek(53280)+1:poke53280,peek(53280)-1:rem flash screen and hit space.
4004 ifpeek(56321)<>239then4001
4005 return
4100 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
4105 return
