10 GOSUB 10000: REM INIT THE GAME AND SETUP VARIABLES AND CONSTANTS
20 GOSUB 11000: REM START THE GAME
127 REM ******************************
128 REM CREATE MAZE
129 REM ******************************
130 A=H*V+C1
140 Q=C0:Z=C0:X=INT(H*RND(H))+C1
150 AA=X
160 A(X,0)=C1:C=C2
170 R=X:S=C1:GOTO240
180 IFR<>HGOTO220
190 IFS<>VGOTO210
200 R=C1:S=C1:GOTO230
210 R=C1:S=S+C1:GOTO230
220 R=R+C1
230 IFA(R,S-C1)=C0GOTO180
240 IFR-C1=C0GOTO560
250 IFA(R-C1,S-C1)GOTO560
260 IFS-C1=C0GOTO400
270 IFA(R,S-C2)GOTO400
280 IFR=HGOTO320
290 IFA(R+C1,S-C1)GOTO320
300 X=INT(C3*RND(C1))+C1
310 ONXGOTO870,910,950
320 IFS<>VGOTO350
330 IFZ=C1GOTO380
340 Q=C1:GOTO360
350 IFA(R,S)GOTO380
360 X=INT(C3*RND(C1))+C1
370 ONXGOTO870,910,1020
380 X=INT(C2*RND(C1))+C1
390 GOTO370
400 IFR=HGOTO500
410 IFA(R+C1,S-C1)GOTO500
420 IFS<>VGOTO450
430 IFZ=C1GOTO480
440 Q=C1:GOTO460
450 IFA(R,S)GOTO480
460 X=INT(C3*RND(C1))+C1
470 ONXGOTO870,950,1020
480 X=INT(C2*RND(C1))+C1
490 GOTO470
500 IFS<>VGOTO530
510 IFZ=C1GOTO870
520 Q=C1:GOTO540
530 IFA(R,S)GOTO870
540 X=INT(C2*RND(C1))+C1
550 ONXGOTO870,1020
560 IFS-C1=C0GOTO740
570 IFA(R,S-C2)GOTO740
580 IFR=HGOTO680
590 IFA(R+C1,S-C1)GOTO680
600 IFS<>VGOTO630
610 IFZ=C1GOTO660
620 Q=C1:GOTO640
630 IFA(R,S)GOTO660
640 X=INT(C3*RND(C1))+C1
650 ONXGOTO910,950,1020
660 X=INT(C2*RND(C1))+C1
670 GOTO650
680 IFS<>VGOTO710
690 IFZ=C1GOTO910
700 Q=C1:GOTO720
710 IFA(R,S)GOTO910
720 X=INT(C2*RND(C1))+C1
730 ONXGOTO910,1020
740 IFR=HGOTO820
750 IFA(R+C1,S-C1)GOTO820
760 IFS<>VGOTO790
770 IFZ=C1GOTO950
780 Q=C1:GOTO800
790 IFA(R,S)GOTO950
800 X=INT(C2*RND(C1))+C1
810 ONXGOTO950,1020
820 IFS<>VGOTO850
830 IFZ=C1GOTO180
840 Q=C1:GOTO860
850 IFA(R,S)GOTO180
860 GOTO1020
870 A(R-C1,S-C1)=C
880 C=C+C1:B(R-C1,S-C1)=C2:R=R-C1
890 IFC=AGOTO1120
900 Q=C0:GOTO240
910 A(R,S-C2)=C
920 C=C+C1
930 B(R,S-C2)=C1:S=S-C1:IFC=AGOTO1120
940 Q=C0:GOTO240
950 A(R+C1,S-C1)=C
960 C=C+C1:IF B(R,S-C1)=C0 GOTO 980
970 B(R,S-C1)=C3:GOTO 990
980 B(R,S-C1)=C2
990 R=R+C1
1000 IFC=AGOTO1120
1010 GOTO560
1020 IFQ=C1GOTO1080
1030 A(R,S)=C:C=C+C1:IFB(R,S-C1)=C0GOTO1050
1040 B(R,S-C1)=C3:GOTO1060
1050 B(R,S-C1)=C1
1060 S=S+C1:IFC=AGOTO1120
1070 GOTO240
1080 Z=C1
1090 IFB(R,S-C1)=C0GOTO1110
1100 B(R,S-C1)=C3:Q=C0:GOTO180
1110 B(R,S-C1)=C1:Q=C0:R=C1:S=C1:GOTO230
1120 IFZ<>C1THENX=INT(H*RND(C1))+C1:B(X,V-C1)=B(X,V-C1)+C1
1130 GOSUB1140:POKESC+12*LL+18-H+LL*V+2*AA,30:GOTO1410

1139 REM ******************************
1140 REM DISPLAY THE ENTIRE MAZE
1141 REM ******************************
1150 M1=C1:PRINT CHR$($93);:IF V=11 THEN 1170
1160 FOR I=C1 TO 11-V:PRINT:NEXT I
1170 FOR J=V TO C1 STEP-C1:PRINT SPC(19-H)
1180 FOR I=C1 TO H:PRINT CHR$($12)" ";
1190 IF B(I,J-C1)=C0 GOTO 1230
1200 IF B(I,J-C1)=C2 GOTO 1230
1210 PRINT CHR$($90)" "CHR$($05);
1220 GOTO 1240
1230 PRINT" ";
1240 NEXT I
1250 PRINT" ":REM FINISH LINE  **** JUSTIN - NOT SURE ABOUT THIS COMMENT
1260 PRINT SPC(19-H) CHR$($12)" ";
1270 FOR I=C1 TO H:PRINT CHR$($90)" "CHR$($05)"";
1280 IF B(I,J-C1)<C2 GOTO 1310
1290 PRINT CHR$($90)" "CHR$($05);
1300 GOTO 1320
1310 PRINT" ";
1320 NEXT I:PRINT: REM THIS FINISHS THE LINE
1340 NEXT J
1350 PRINT SPC(19-H)CHR$($12);:FOR I=C1 TO H
1360 IF I=AA GOTO 1380
1370 PRINT"  ";:GOTO 1390: REM APPEARS TO BE BOTTOM ROW
1380 PRINT" "CHR$($90)" "CHR$($05);: REM THIS IS ENTRANCE TO MAZE
1390 NEXT I
1400 PRINT" ":RETURN: REM THIS IS THE LAST BOTTOM RIGHT HAND CORNER
1410 W=AA
1420 FOR J=C0 TO V-C1
1430 FOR I=C1 TO H
1440 IF J GOTO 1470
1450 IF I=W THEN A(I,J)=(C3-B(I,J))*C2:GOTO 1490
1460 M=C1:GOTO 1480
1470 M=(A(I,J-C1)AND2)/C2
1480 A(I,J)=(C3-B(I,J))*C2+M*C8
1490 IF I=C1 THEN M=C1:GOTO 1510
1500 M=(A(I-C1,J)AND4)/C4
1510 A(I,J)=A(I,J)+M
1520 NEXT I: REM LOOP-1430
1530 NEXT J: REM LOOP-1420
1540 PRINT CHR$($93): REM THIS CLEARS THE SCREEN - NO TIME TO SEE
1541 REM INPUT: REM PAUSE UNTIL KEYPRESS
1550 X=W:Y=C0:Z=C1:EL=C1:ER=C1
1560 GOTO 2260
1570 PRINT CHR$($11)CHR$($11)"YOU CAN GIVE THE FOLLOWING INSTRUCTIONS:";
1580 PRINT CHR$($11)"{REVERSE ON}F{REVERSE OFF}-MOVE FORWARDS ONE BLOCK;"
1590 PRINT CHR$($11)"{REVERSE ON}L{REVERSE OFF}-TURN LEFT{SH SPACE}90 DEGRESS;"
1600 PRINT CHR$($11)"{REVERSE ON}R{REVERSE OFF}-TURN RIGHT{SH SPACE}90 DEGREES;"
1610 PRINT CHR$($11)"{REVERSE ON}H{REVERSE OFF}-HELP!"
1615 PRINT CHR$($11)"Q - QUIT"
1620 RETURN
1630 GOSUB 1140:PRINT CHR$($11)"YOU ARE HERE "CHR$($A6)", FACING "A$(Z)
1640 POKE SC+LL*12+18-H+LL*V+2*X-(LL*2)*Y,102
1650 IF Y>V GOTO 12000: REM YOU HAVE WON
1660 PRINT CHR$($13)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11);
1661 PRINT CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11);
1662 PRINT CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11); 
1663 PRINT CHR$($11)CHR$($11)CHR$($11)CHR$($11)"WHAT NOW?";
1670 GET Z$:IF Z$="" GOTO 1670
1680 IF Z$="L" GOTO 1730
1690 IF Z$="R" GOTO 1750
1700 IF Z$="F" GOTO 2210
1710 IF Z$="H" GOTO 1630
1715 IF Z$="Q" END
1720 GOTO 1670
1730 Z=Z-C1:IF Z<C1 THEN Z=Z+C4
1740 GOTO2260
1750 Z=Z+C1:IF Z>C4 THEN Z=Z-C4
1760 GOTO 2260
1770 RETURN
1780 IFZ=C1THENA1=A-C1:B1=B-C1:GOTO1830
1790 IFZ=C2ANDB<VTHENA1=A:B1=B:GOTO1830
1800 IFZ=C3THENA1=A+C1:B1=B-C1:GOTO1830
1810 IFZ=C4ANDB>C1THENA1=A:B1=B-C2:GOTO1830
1820 EL=C1:RETURN
1830 F=A(A1,B1):IFZ=C1GOTO1850
1840 FORI=C2TOZ:F=(FAND14)/C2+(FANDC1)*C8:NEXT
1850 EL=(FANDC2)/C2:RETURN
1860 IFZ=C1THENA1=A+C1:B1=B-C1:GOTO1910
1870 IFZ=C2ANDB>C1THENA1=A:B1=B-C2:GOTO1910
1880 IFZ=C3THENA1=A-C1:B1=B-C1:GOTO1910
1890 IFZ=C4ANDB<VTHENA1=A:B1=B:GOTO1910
1900 ER=C1:RETURN
1910 F=A(A1,B1):IFZ=C1GOTO1930
1920 FORI=C2TOZ:F=(FAND14)/C2+(FANDC1)*C8:NEXT
1930 ER=(FANDC2)/C2:RETURN
1940 IF B=C0 GOTO 2020
1950 IFB>VTHENE=C3:RETURN
1960 F=A(A,B-C1):IFZ=C1GOTO1980
1970 FORI=C2TOZ:F=(FAND14)/C2+(FANDC1)*C8:NEXT
1980 C=FANDC1:D=(FAND4)/C4:E=(FAND2)/C2
1990 IF C=C0 THEN GOSUB 1780
2000 IF D=C0 THEN GOSUB 1860
2010 RETURN
2020 C=C0:D=C0:E=-C1
2030 IFZ<>1GOTO2070
2040 E=C1
2050 IFA=WTHENE=C0
2060 RETURN
2070 IFZ=C3THENE=C2:RETURN
2080 IFZ=C2ANDA=HTHENE=C2:RETURN
2090 IFZ=C4ANDA=C1THENE=C2:RETURN
2100 RETURN
2110 IFE>C0GOTO2170
2120 IFZ=C1THENB=B+C1:RETURN
2130 IFZ=C2THENA=A+C1:RETURN
2140 IFZ=C3THENB=B-C1:RETURN
2150 IFZ=C4THENA=A-C1:RETURN
2160 PRINT CHR$($13) CHR$($11) CHR$($11) CHR$($11) CHR$($11) CHR$($11);
2161 PRINT CHR$($11) CHR$($11) CHR$($11) CHR$($11) CHR$($11);
2162 PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2163 PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);:RETURN
2170 IFE=C0GOTO2190
2180 PRINT CHR$($A5);
2190 S=C1
2200 RETURN
2210 A=X:B=Y
2220 GOSUB1940
2230 GOSUB2110
2240 X=A:Y=B
2250 IFE>C0GOTO1650
2260 A=X:B=Y
2270 GOSUB 1940

2280 REM DISPLAY 5 DEPTHS
2290 FORT=C1TO5
2300 GOSUB2410
2310 IFETHENT=C5:GOTO2350
2320 GOSUB2110
2330 GOSUB1940
2340 IFE>C1THENT=C5:GOTO2350
2350 NEXTT
2360 IF X=W AND Y=C0 AND Z=C1 GOTO2400
2370 IFX<>WANDY=C0ANDZ=C1THEN GOSUB2160:PRINT CHR$($91) CHR$($91) CHR$($91);
2371 IFX<>WANDY=C0ANDZ=C1THEN PRINT CHR$($91) CHR$($1D) CHR$($1D); 
2372 IFX<>WANDY=C0ANDZ=C1THEN PRINT CHR$($1D)"EXTERNAL WALL" GOTO 2390
2380 GOTO2400
2390 GOSUB2160:PRINT"{UP}{UP}"CHR$($1D)CHR$($1D)"YOU'RE OUTSIDE!"
2400 GOTO1650
2410 ONTGOTO2420,2780,3220,3710,4250

2420 REM DISPLAY DEPTH 1
2430 PRINT CHR$($93);
2440 IFE>C2THENRETURN
2450 IFE<C0ORE>C1THENGOSUB2180:RETURN
2460 FOR I=C1 TO 21
2465 IF C=C1 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2466 IF C=C1 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($A7);:GOTO 2520
2470 IF Y=C0 THEN PRINT CHR$($1D) CHR$($12) MID$(W$,(IANDC1)+C1,C8);:GOTO2520
2480 IF EL=C1 THEN PRINT CHR$($1D) CHR$($A7) CHR$($A7) CHR$($A7) CHR$($A7);
2481 IF EL=C1 THEN PRINT CHR$($A7) CHR$($A7) CHR$($A7) CHR$($A7);:GOTO 2520
2490 IF I=C2 THEN PRINT CHR$($1D) CHR$($A4) CHR$($A4) CHR$($A4) CHR$($A4);
2491 IF I=C2 THEN PRINT CHR$($A4) CHR$($A4) CHR$($A4) CHR$($A6);:GOTO 2520
2500 IF I<18 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2501 IF I<18 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($A6);:GOTO 2520
2510 PRINT CHR$($1D) CHR$($12)"       "CHR$($92)CHR$($A6);
2520 IF E=C0 THEN PRINT SPC(22);:GOTO2550
2530 IF Y=C0 THEN PRINT CHR$($12) MID$(W$,(IANDC1)+C1,22);:GOTO2550
2540 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2541 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2542 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2543 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2550 IF D=C1 THEN PRINT CHR$($A5): GOTO 2610
2560 IF Y=C0 THEN PRINT CHR$($12) MID$(W$,(IANDC1)+C1,C8):GOTO 2610
2570 IF ER=C1 THEN PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2571 IF ER=C1 THEN PRINT CHR$($A6) CHR$($A6) CHR$($A6): GOTO 2610
2580 IF ER=C2 THEN PRINT CHR$($A6) CHR$($A4) CHR$($A4) CHR$($A4) CHR$($A4);
2581 IF ER=C2 THEN PRINT CHR$($A4) CHR$($A4) CHR$($A4): GOTO 2610
2590 IF I<18 THEN PRINT CHR$($A6):GOTO2610
2600 PRINT CHR$($A6)CHR$($12)"       "
2610 NEXT
2620 FOR I=C1 TO C3:IF C=C1 OR(X=WANDY=C0)GOTO 2680
2630 IF I<>C1 THEN 2650
2640 IF EL=C0 THEN PRINT CHR$($1D) CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3)
2641 PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3)CHR$($CE);:GOTO 2690
2650 PRINT CHR$($1D) CHR$($12) LEFT$(SP$,C8-I)CHR$($CE)LEFT$(SP$,I-C1);
2660 IFI=C1GOTO2690
2670 GOTO2700
2680 PRINT SPC(C9-I)CHR$($12)CHR$($A8) LEFT$(SP$,I-C1);:IF I<>C1 THEN 2700
2690 IF E=C0 THEN PRINT CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2691 PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2692 PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2693 PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2694 PRINT CHR$($A3);:GOTO 2710
2700 PRINT CHR$($12)"                      ";
2710 IF D=C1 OR(X=WANDY=C0)GOTO 2750
2720 IF I<>C1 THEN 2740
2730 IF ER=C0 THEN PRINT CHR$($12)CHR$($CD)CHR$($A3)CHR$($A3)CHR$($A3)CHR$($A3);
2731 IF ER=C0 THEN PRINT CHR$($A3)CHR$($A3)CHR$($A3)CHR$($A3):GOTO 2760
2740 PRINT CHR$($12) LEFT$(SP$,I-C1)CHR$($CD)LEFT$(SP$,C8-I):GOTO 2760
2750 PRINT CHR$($12) LEFT$(SP$,I-C1) CHR$($DF)
2760 NEXTI
2770 RETURN

2780 REM DISPLAY DEPTH 2
2790 PRINT CHR$($13);:Z$=CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)
2791 Z$=Z$+CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)
2800 FORI=C1TOC2:PRINTZ$;:IFC=C0GOTO2830
2810 PRINTSPC(I+C1)CHR$($CD);SPC(C2-I);:GOTO2860
2820 PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($CD);:GOTO2860
2830 IFI=C1THENPRINTSPC(C4):GOTO2860
2840 IFEL=C1THENPRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);:GOTO2860
2850 PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($A4);
2860 IFE=C0ORI=C1THENPRINTSPC(14);:GOTO2880
2870 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
2871 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
2880 IFD=C0GOTO2900
2890 PRINTSPC(C2-I)CHR$($CE):GOTO2930
2900 IFI=C1THENPRINT:GOTO2930
2910 IFER=C1THENPRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4):GOTO2930
2920 PRINT CHR$($A4)
2930 NEXT
2940 FOR I=C1 TO 15
2941 PRINT Z$;
2942 IF C=C1 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($A7);:GOTO2990
2950 IF EL=C1 THEN PRINT CHR$($12) CHR$($A6) CHR$($A6) CHR$($A6);
2951 IF EL=C1 THEN PRINT CHR$($A6) CHR$($92);: GOTO 2990
2960 IF I=C3 THEN PRINT CHR$($A4) CHR$($A4) CHR$($A4) CHR$($12);
2961 IF I=C3 THEN PRINT CHR$($A6) CHR$($92);: GOTO 2990
2970 IF I>12 THEN PRINT CHR$($12)"   " CHR$($A6) CHR$($92);: GOTO 2990
2980 PRINT"   "CHR$($12)CHR$($A6)CHR$($92);
2990 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2991 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2992 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);:GOTO 3010
3000 PRINT CHR$($12) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
3001 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
3002 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($92);
3010 IF D=C1THEN PRINT CHR$($A5):GOTO3060
3020 IF ER=C1THEN PRINT CHR$($12)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6):GOTO3060
3030 IF I=C3 THEN PRINT CHR$($12)CHR$($A6)CHR$($92);
3031 IF I=C3 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4):GOTO3060
3040 IF I>12THEN PRINT CHR$($12)CHR$($A6)"   ":GOTO3060
3050 PRINT CHR$($12)CHR$($A6)
3060 NEXT
3070 FORI=C1TO4:PRINTZ$;:IFC=C1GOTO3120
3080 IFI<>C1GOTO3110
3090 IF EL=C0 THEN PRINT CHR$($12)CHR$($A3)CHR$($A3)CHR$($A3)CHR$($CE);:GOTO3130
3100 PRINT CHR$($12)"   "CHR$($CE);:GOTO3130
3110 PRINT CHR$($12) LEFT$(SP$,C4-I)CHR$($CE)LEFT$(SP$,I-C1);:GOTO3140
3120 PRINTSPC(C4-I)CHR$($12)CHR$($A9)LEFT$(SP$,I-C1);:IFI<>C1THEN3140
3130 IF E=C0 THEN PRINT CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3131 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3132 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3133 IF E=C0 THEN PRINT  CHR$($A3);:GOTO 3150
3140 PRINT CHR$($12)"              ";
3150 IF D=C1 GOTO 3190
3160 IF I<>C1 THEN 3180
3170 IF ER=C0 THEN PRINT CHR$($12)CHR$($CD)CHR$($A3)CHR$($A3)CHR$($A3):GOTO3200
3180 PRINT CHR$($12) LEFT$(SP$,I-C1)CHR$($CD)LEFT$(SP$,C4-I):GOTO3200
3190 PRINT CHR$($12) LEFT$(SP$,I-C1) CHR$($DF):GOTO3200
3200 NEXTI
3210 RETURN

3220 REM DISPLAY DEPTH 3
3225 PRINT CHR$($9B): REM CHANGE COLOUR TO LIGHT GREY
3230 PRINT CHR$($13)CHR$($11)CHR$($11);
3231 Z$=Z$+CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)
3240 FORI=C1TO3:PRINTZ$;:IFC=C0GOTO3260
3250 PRINTSPC(I-C1)CHR$($CD)SPC(C3-I);:GOTO3290
3260 IF I<C3 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D);:GOTO3290
3270 IF EL=C1 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4);:GOTO3290
3280 PRINT CHR$($1D)CHR$($1D)CHR$($A4);
3290 IF E=C0 OR I<=C2 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);
3291 IF E=C0 OR I<=C2 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);:GOTO3310
3300 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
3301 PRINT CHR$($A4)CHR$($A4);
3310 IF D=C0 GOTO 3330
3320 PRINT SPC(3-I)CHR$($CE):GOTO3360
3330 IF I<C3 THEN PRINT:GOTO3360
3340 IF ER=C1 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4):GOTO3360
3350 PRINT CHR$($A4)
3360 NEXT
3370 FORI=C1TO9:PRINTZ$;:IFC=C1THENPRINT CHR$($1D)CHR$($1D)CHR$($A7);:GOTO3420
3380 IF EL=C1 THEN PRINT CHR$($A6)CHR$($A6)CHR$($A6);:GOTO3420
3390 IF I=C2 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4);:GOTO3420
3400 IF I>C7 THEN PRINT CHR$($12)"  "CHR$($92)CHR$($A6);:GOTO3420
3410 PRINT"  "CHR$($A6);
3420 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
3421 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D);:GOTO 3440
3430 PRINT CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6);
3431 PRINT CHR$($A6);
3440 IF D=C1 THEN PRINT CHR$($A5):GOTO3490
3450 IFER=C1THENPRINT CHR$($A6)CHR$($A6)CHR$($A6):GOTO3490
3460 IFI=C2THENPRINT CHR$($A6)CHR$($A4)CHR$($A4):GOTO3490
3470 IFI>C7THENPRINT CHR$($A6)CHR$($12)"  "CHR$($92):GOTO3490
3480 PRINT CHR$($A6)
3490 NEXT
3500 FORI=C1TO3:PRINTZ$;:IFC=C1GOTO3560
3510 IF I<>C1 THEN 3530
3520 IF EL=C0 THEN PRINT CHR$($12)CHR$($A3)CHR$($A3)CHR$($CE);:GOTO3570
3530 PRINT CHR$($12) LEFT$(SP$,C3-I)CHR$($CE)LEFT$(SP$,I-C1);
3540 IF I=C1 THEN 3570
3550 GOTO 3580
3560 PRINT SPC(C3-I) CHR$($12)CHR$($A9)LEFT$(SP$,I-C1);:GOTO3540
3570 IF E=C0 THEN PRINT CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3571 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);:GOTO 3590
3580 PRINT CHR$($12)"        ";
3590 IFD=C1GOTO3650
3600 IFI<>C1THEN3620
3610 IF ER=C0 THEN PRINT CHR$($12)CHR$($CD)CHR$($A3)CHR$($A3):GOTO3690
3620 PRINT CHR$($12) LEFT$(SP$,I-C1) CHR$($12)CHR$($CD)LEFT$(SP$,C3-I):GOTO3690
3650 PRINT CHR$($12) LEFT$(SP$,I-C1) CHR$($DF)
3690 NEXT I
3695 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
3700 RETURN

3710 REM DISPLAY DEPTH 4
3715 PRINT CHR$($98): REM CHANGE COLOUR TO MEDIUM GREY
3720 PRINT CHR$($13) CHR$($11) CHR$($11) CHR$($11) CHR$($11) CHR$($11);
3721 Z$=Z$+CHR$($1D)+CHR$($1D)+CHR$($1D)
3730 FORI=C1TO2:PRINTZ$;:IFC=C0GOTO3770
3740 PRINT SPC(I-C1)CHR$($CD) SPC(C2-I);:GOTO3810
3770 IF I=C1 THEN PRINT CHR$($1D) CHR$($1D);:GOTO3810
3790 IF EL=C1 THEN PRINT CHR$($A4)CHR$($A4);:GOTO3810
3800 PRINT CHR$($1D)CHR$($A4);
3810 IFE=C0ORI=C1THENPRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);:GOTO3830
3820 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
3830 IF D=C0 GOTO 3870
3840 IF I=C1 THEN PRINT CHR$($1D);
3850 PRINT CHR$($CE):GOTO3910
3870 IFI=C1THENPRINT:GOTO3910
3890 IFER=C1THENPRINT CHR$($A4)CHR$($A4):GOTO3910
3900 PRINT CHR$($A4)
3910 NEXT
3920 FOR I=C1 TO 5:PRINT Z$;:IF C=C1 THEN PRINT CHR$($1D)CHR$($A7);:GOTO3970
3930 IF EL=C1 THEN PRINT CHR$($12)CHR$($A6)CHR$($A6)CHR$($92);:GOTO3970
3940 IF I=C1 THEN PRINT CHR$($A4) CHR$($12)CHR$($A6)CHR$($92);:GOTO3970
3950 IF I>4 THENP RINT CHR$($12)CHR$($A3)CHR$($A6)CHR$($92);:GOTO3970
3960 PRINT" "CHR$($12)CHR$($A6)CHR$($92);
3970 IFE=C0THENPRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);:GOTO3990
3980 PRINT CHR$($12)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($92);
3990 IF D=C1 THEN PRINT CHR$($A5):GOTO4040
4000 IF ER=C1 THEN PRINT CHR$($12)CHR$($A6)CHR$($A6):GOTO4040
4010 IF I=C1T HEN PRINT CHR$($12)CHR$($A6)CHR$($92) CHR$($A4):GOTO4040
4020 IF I>C4 THEN PRINT CHR$($12)CHR$($A6)" ":GOTO4040
4030 PRINT CHR$($12)CHR$($A6)
4040 NEXT
4050 FORI=C1TO2:PRINTZ$;:IFC=C1GOTO4100
4060 IF I<>C1 THEN 4080
4070 IF EL=C0 THEN PRINT CHR$($12)CHR$($A3)CHR$($CE);:GOTO4130
4080 PRINT CHR$($12) LEFT$(SP$,C2-I)CHR$($CE)LEFT$(SP$,I-C1);
4085 IFI=C1THEN4130
4090 GOTO4140
4100 IFI=C1THENPRINT CHR$($1D);
4110 PRINT CHR$($12)CHR$($A9);
4120 IFI=C2THENPRINT" ";:GOTO4140
4130 IFE=C0THENPRINT CHR$($12)CHR$($A3)CHR$($A3)CHR$($A3)CHR$($A3);:GOTO4150
4140 PRINT CHR$($12)"    ";
4150 IFD=C1GOTO4200
4160 IFI<>C1THEN4180
4170 IFER=C0THENPRINT CHR$($12)CHR$($CD)CHR$($A3):GOTO4230
4180 PRINT CHR$($12) LEFT$(SP$,I-C1)" "LEFT$(SP$,C2-I):GOTO4230
4200 PRINT CHR$($12);:IFI=C2THENPRINT" ";
4210 PRINT CHR$($DF)
4230 NEXT I
4235 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
4240 RETURN

4250 REM DISPLAY DEPTH 5
4255 PRINT CHR$($97): REM CHANGE COLOUR TO DARK GREY
4260 PRINT CHR$($13)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11);
4261 PRINT CHR$($11);:Z$=Z$+CHR$($1D)+CHR$($1D)
4270 PRINTZ$;:IFC=C0GOTO4290
4280 PRINT CHR$($CD);:GOTO4300
4290 PRINT CHR$($A4);
4300 IFE=C0THENPRINT CHR$($1D)CHR$($1D);:GOTO4320
4310 PRINT CHR$($A4)CHR$($A4);
4320 IFD=C0GOTO4340
4330 PRINT CHR$($CE):GOTO4350
4340 PRINT CHR$($A4)
4350 FORI=C1TO3:PRINTZ$;:IFC=C1GOTO4370
4360 PRINT CHR$($A6);:GOTO4380
4370 PRINT CHR$($A7);
4380 IFE=C0THENPRINT CHR$($1D)CHR$($1D);:GOTO4400
4390 PRINT CHR$($A6)CHR$($A6);
4400 IFD=C0THENPRINT CHR$($A6):GOTO4420
4410 PRINT CHR$($A5)
4420 NEXT
4430 PRINTZ$;:IFC=C1GOTO4450
4440 PRINT CHR$($12)CHR$($CE);:GOTO4460
4450 PRINT CHR$($12)CHR$($A9);
4460 IFE=C1THENPRINT CHR$($12)"  ";:GOTO4480
4470 PRINT CHR$($12)CHR$($A3)CHR$($A3);
4480 IFD=C1GOTO4500
4490 PRINT CHR$($12)CHR$($CD):GOTO4510
4500 PRINT CHR$($12) CHR$($DF)
4505 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
4510 RETURN

4590 FORI=0TO10:FORJ=0TO19
4600 PRINT RIGHT$("0"+MID$(STR$(A(J,I)),2),2)CHR$($1D);:NEXTJ:PRINT:NEXTI
4610 PRINT:PRINT
4620 FORJ=V-1TO0STEP-1:FORI=1TOH
4630 PRINT RIGHT$("0"+MID$(STR$(B(I,J)),2),2)CHR$($1D);:NEXTI:PRINT:NEXTJ

10000 REM LABYRINTH BY COMMODORE, UPDATED FOR X16 BY JUSTIN
10010 REM VARIABLES
10020 REM H=HORIZONTAL, ENTERED BY USER AT START
10030 REM V=VERTICAL, ENTERED BY USER AT START
10040 REM https://www.c64-wiki.com/wiki/PETSCII_Codes_in_Listings
10050 REM SCREEN($00)
10060 REM CONSTANTS
10070 C0=0:C1=1:C2=2:C3=3:C4=4:C5=5:C6=6:C7=7:C8=8:C9=9
10080 SC=1024: REM SCREEN MEMORY?
10090 LL=40: REM 
10100 DIM A(19,11),B(19,11)
10110 A$(1)="NORTH":A$(2)="EAST":A$(3)="SOUTH":A$(4)="WEST"
10120 W$=""+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10130 W$=W$+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10140 W$=W$+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10150 W$=W$+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10160 SP$="                                               "
10900 RETURN

11000 REM START GAME
11010 M1=C0:PRINT CHR$($93)CHR$($05)CHR$($11),"ENTER DIMENSIONS OF LABYRINTH:"
11020 PRINT CHR$($11): INPUT "HOW WIDE";H
11030 IF H=C0 OR H>19 THEN PRINT CHR$($91),CHR$($91);:GOTO 11020
11040 PRINT CHR$($11): INPUT"HOW DEEP";V
11050 IF V=C0 OR V>10 THEN PRINT CHR$($91),CHR$($91);:GOTO 11040
11060 PRINT CHR$($11)"NOW CREATING A"H"X"V"LABYRINTH"
11900 RETURN

12000 REM WIN GAME
12010 PRINT CHR$($93)"YOU'RE OUT!"
12030 IF M1 THEN PRINT CHR$($11)CHR$($11)CHR$($11)CHR$($11):GOTO 12060
12040 PRINT CHR$($93)"HERE IS THE MAZE":GOSUB1780
12050 GOSUB 1140
12060 INPUT"ANOTHER GAME";Z$
12070 IF Z$="Y" GOTO 20: REM START THE GAME AGAIN
12080 END

50000 REM ****************************** 
50010 REM DISPLAY MEMORY ARRAY
50020 REM ******************************
50030 FOR I=1 TO H
50040 FOR J=1 TO V
50050 PRINT B(J,I);
50060 NEXT J
50070 PRINT
50080 NEXT I
50090 RETURN
