10 GOSUB 10000: REM INIT THE GAME AND SETUP VARIABLES AND CONSTANTS
20 GOSUB 11000: REM START THE GAME
127 REM ******************************
128 REM CREATE MAZE - SPAGETTI CODE
129 REM ******************************
130 A=H*V+C1
140 Q=C0:Z=C0:X=INT(H*RND(H))+C1
149 REM LINE 150-160 RECORD START POINT IN MAZE
150 AA=X
160 A(X,0)=C1:C=C2
170 R=X:S=C1:GOTO 240
180 IF R<>H GOTO 220
190 IF S<>V GOTO 210
200 R=C1:S=C1:GOTO 230
210 R=C1:S=S+C1:GOTO 230
220 R=R+C1
230 IF A(R,S-C1)=C0 GOTO 180
240 IF R-C1=C0 GOTO 560
250 IF A(R-C1,S-C1) GOTO 560
260 IF S-C1=C0 GOTO 400
270 IF A(R,S-C2)GOTO 400
280 IF R=H GOTO 320
290 IF A(R+C1,S-C1)GOTO 320
299 REM LEFT/DOWN/RIGHT
300 X=INT(C3*RND(C1))+C1
310 ON X GOTO 870,910,950
320 IF S<>V GOTO 350
330 IF Z=C1 GOTO 380
340 Q=C1:GOTO 360
350 IF A(R,S)GOTO 380
359 REM LEFT/DOWN/UP
360 X=INT(C3*RND(C1))+C1
370 ON X GOTO 870,910,1020
379 REM LEFT/DOWN
380 X=INT(C2*RND(C1))+C1
390 GOTO 370
400 IF R=H GOTO 500
410 IF A(R+C1,S-C1)GOTO 500
420 IF S<>V GOTO 450
430 IF Z=C1 GOTO 480
440 Q=C1:GOTO 460
450 IF A(R,S)GOTO 480
459 REM LEFT/RIGHT/UP
460 X=INT(C3*RND(C1))+C1
470 ON X GOTO 870,950,1020
479 REM LEFT/RIGHT
480 X=INT(C2*RND(C1))+C1
490 GOTO 470
500 IF S<>V GOTO 530
510 IF Z=C1 GOTO 870
520 Q=C1:GOTO 540
530 IF A(R,S)GOTO 870
539 REM LEFT/UP
540 X=INT(C2*RND(C1))+C1
550 ON X GOTO 870,1020
560 IF S-C1=C0 GOTO 740
570 IF A(R,S-C2)GOTO 740
580 IF R=H GOTO 680
590 IF A(R+C1,S-C1)GOTO 680
600 IF S<>V GOTO 630
610 IF Z=C1 GOTO 660
620 Q=C1:GOTO 640
630 IF A(R,S)GOTO 660
639 REM DOWN/RIGHT/UP
640 X=INT(C3*RND(C1))+C1
650 ON X GOTO 910,950,1020
659 REM DOWN/RIGHT
660 X=INT(C2*RND(C1))+C1
670 GOTO 650
680 IF S<>V GOTO 710
690 IF Z=C1 GOTO 910
700 Q=C1:GOTO 720
710 IF A(R,S)GOTO 910
719 REM DOWN/UP
720 X=INT(C2*RND(C1))+C1
730 ON X GOTO 910,1020
740 IF R=H GOTO 820
750 IF A(R+C1,S-C1)GOTO 820
760 IF S<>V GOTO 790
770 IF Z=C1 GOTO 950
780 Q=C1:GOTO 800
790 IF A(R,S)GOTO 950
799 REM RIGHT/UP
800 X=INT(C2*RND(C1))+C1
810 ON X GOTO 950,1020
820 IF S<>V GOTO 850
830 IF Z=C1 GOTO 180
840 Q=C1:GOTO860
850 IF A(R,S)GOTO 180
860 GOTO 1020
869 REM LEFT
870 A(R-C1,S-C1)=C
880 C=C+C1:B(R-C1,S-C1)=C2:R=R-C1
890 IF C=A GOTO 1120
900 Q=C0:GOTO 240
909 REM DOWN
910 A(R,S-C2)=C
920 C=C+C1
930 B(R,S-C2)=C1:S=S-C1:IF C=A GOTO 1120
940 Q=C0:GOTO 240
949 REM RIGHT
950 A(R+C1,S-C1)=C
960 C=C+C1:IF B(R,S-C1)=C0 GOTO 980
970 B(R,S-C1)=C3:GOTO 990
980 B(R,S-C1)=C2
990 R=R+C1
1000 IF C=A GOTO 1120
1010 GOTO560
1020 IF Q=C1 GOTO 1080
1029 REM UP
1030 A(R,S)=C:C=C+C1:IF B(R,S-C1)=C0 GOTO 1050
1040 B(R,S-C1)=C3:GOTO1060
1050 B(R,S-C1)=C1
1060 S=S+C1:IF C=A GOTO 1120
1070 GOTO 240
1079 REM EXIT AT TOP OF SCREEN
1080 Z=C1
1090 IFB(R,S-C1)=C0 GOTO 1110
1100 B(R,S-C1)=C3:Q=C0:GOTO 180
1110 B(R,S-C1)=C1:Q=C0:R=C1:S=C1:GOTO 230
1119 REM MAKE EXIT IF NOT THERE
1120 IF Z<>C1 THEN X=INT(H*RND(C1))+C1:B(X,V-C1)=B(X,V-C1)+C1
1121 REM END OF MAZE BUILD

1130 GOSUB 1140:
1135 IF X6=1 THEN VPOKE 0,SC+12*LL+18-H+LL*V+2*AA,30:GOTO 1410
1136 IF X6=0 THEN POKE SC+12*LL+18-H+LL*V+2*AA,30:GOTO 1410

1139 REM ******************************
1140 REM DISPLAY THE ENTIRE MAZE
1141 REM ******************************
1142 REM THIS IS DRAWING THE WALLS OF THE MAZE NOT THE PATH
1150 M1=C1:PRINT CHR$($93);:IF V=11 THEN 1170
1160 FOR I=C1 TO 11-V:PRINT:NEXT I: REM PRINT BLANK LINES ABOVE MAZE

1170 FOR J=V TO C1 STEP -C1
1175 PRINT SPC(19-H): REM PRINT SPACES TO CENTER MAZE ON 40 COLUMN DISPLAY

1176 REM START OF HOZIZONTAL LINE - MOSTLY WALL
1180 FOR I=C1 TO H
1185 PRINT CHR$($12)"-";:REM REVERSE ON + SPACE, THE MAZE WALLS
1190 IF B(I,J-C1)=C0 GOTO 1230
1200 IF B(I,J-C1)=C2 GOTO 1230
1210 PRINT CHR$($90)" "CHR$($05);:REM BLACK + SPACE + WHITE, THE MAZE PATH
1220 GOTO 1240
1230 PRINT"#";
1240 NEXT I
1250 PRINT":":REM LAST WALL CHARACTER ON LINE 

1260 PRINT SPC(19-H) CHR$($12)".";: REM CENTER MAZE ON 40 COL, LEFT SIDE WALL  
1270 FOR I=C1 TO H
1275 PRINT CHR$($90)" "CHR$($05);
1280 IF B(I,J-C1)<C2 GOTO 1310
1290 PRINT CHR$($90)" "CHR$($05);
1300 GOTO 1320
1310 PRINT"$";
1320 NEXT I

1325 PRINT"Y": REM THIS FINISHS THE LINE
1340 NEXT J

1345 REM THIS IS BOTTOM ROW WITH ENTRANCE TO MAZE
1350 PRINT SPC(19-H)CHR$($12);: REM CENTER MAZE ON 40 COL, LEFT SIDE WALL 
1355 FOR I=C1 TO H
1360 IF I=AA GOTO 1380
1370 PRINT"  ";:GOTO 1390:
1380 PRINT" "CHR$($90)" "CHR$($05);: REM THIS IS ENTRANCE TO MAZE
1390 NEXT I
1400 PRINT" "
1405 RETURN: REM END DISPLAY THE ENTIRE MAZE 
1406 REM ******************************

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
1550 X=W:Y=C0:Z=C1:EL=C1:ER=C1
1560 GOTO 2260
1570 PRINT CHR$($11)CHR$($11)"YOU CAN GIVE THE FOLLOWING INSTRUCTIONS:";
1580 PRINT CHR$($11)"{REVERSE ON}F{REVERSE OFF}-MOVE FORWARDS ONE BLOCK;"
1590 PRINT CHR$($11)"{REVERSE ON}L{REVERSE OFF}-TURN LEFT{SH SPACE}90 DEGRESS;"
1600 PRINTCHR$($11)"{REVERSE ON}R{REVERSE OFF}-TURN RIGHT{SH SPACE}90 DEGREES;"
1610 PRINT CHR$($11)"{REVERSE ON}H{REVERSE OFF}-HELP!"
1615 PRINT CHR$($11)"Q - QUIT"
1620 RETURN

1630 GOSUB 1140:PRINT CHR$($11)"YOU ARE HERE "CHR$($A6)", FACING "A$(Z)
1635 REM DEPENDING ON PLATFORM DRAW AN ARROW ON SCREEN
1640 IF X6=0 THEN POKE SC+LL*12+18-H+LL*V+2*X-(LL*2)*Y,102
1645 IF X6=1 THEN VPOKE 0,SC+(LL*(12+18-H))+(LL*V)+(2*X)-((LL*2)*Y),102
1650 IF Y>V GOTO 12000: REM YOU HAVE WON
1660 PRINT CHR$($13)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11);
1661 PRINT CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11);
1662 PRINT CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11); 
1663 PRINT CHR$($11)CHR$($11)CHR$($11)CHR$($11)"WHAT NOW?";
1670 GET Z$:IF Z$="" GOTO 1670
1680 IF Z$="L" OR Z$=CHR$($9D) GOTO 1730: REM TURN TO LEFT
1690 IF Z$="R" OR Z$=CHR$($1D) GOTO 1750: REM TURN TO RIGHT
1700 IF Z$="F" OR Z$=CHR$($91) GOTO 2210: REM STEP FOWARD
1710 IF Z$="H" GOTO 1630: REM DISPLAY MAZE AND DISPLAY HELP
1715 IF Z$="Q" THEN END: REM END THE GAME
1720 GOTO 1670

1729 REM TURN LEFT
1730 Z=Z-C1:IF Z<C1 THEN Z=Z+C4
1740 GOTO 2260

1749 REM TURN RIGHT
1750 Z=Z+C1:IF Z>C4 THEN Z=Z-C4
1760 GOTO 2260
1770 RETURN

1780 IF Z=C1 THEN A1=A-C1:B1=B-C1:GOTO 1830
1790 IF Z=C2 AND B<V THEN A1=A:B1=B:GOTO 1830
1800 IF Z=C3 THEN A1=A+C1:B1=B-C1:GOTO 1830
1810 IF Z=C4 AND B>C1 THEN A1=A:B1=B-C2:GOTO 1830
1820 EL=C1:RETURN
1830 F=A(A1,B1):IFZ=C1GOTO1850
1840 FOR I=C2 TO Z:F=(F AND 14)/C2+(F AND C1)*C8:NEXT
1850 EL=(FANDC2)/C2:RETURN
1860 IF Z=C1 THEN A1=A+C1:B1=B-C1:GOTO 1910
1870 IF Z=C2 AND B>C1 THEN A1=A:B1=B-C2:GOTO 1910
1880 IF Z=C3 THEN A1=A-C1:B1=B-C1:GOTO 1910
1890 IF Z=C4 AND B<V THEN A1=A:B1=B:GOTO 1910
1900 ER=C1:RETURN
1910 F=A(A1,B1):IFZ=C1GOTO1930
1920 FOR I=C2 TO Z:F=(F AND 14)/C2+(F AND C1)*C8:NEXT
1930 ER=(FANDC2)/C2:RETURN
1940 IF B=C0 GOTO 2020
1950 IF B>V THEN E=C3:RETURN
1960 F=A(A,B-C1):IFZ=C1GOTO1980
1970 FOR I=C2 TO Z:F=(FAND14)/C2+(FANDC1)*C8:NEXT
1980 C=F AND C1:D=(FAND4)/C4:E=(FAND2)/C2
1990 IF C=C0 THEN GOSUB 1780
2000 IF D=C0 THEN GOSUB 1860
2010 RETURN
2020 C=C0:D=C0:E=-C1
2030 IF Z<>1 GOTO 2070
2040 E=C1
2050 IF A=W THEN E=C0
2060 RETURN
2070 IF Z=C3 THEN E=C2:RETURN
2080 IF Z=C2 AND A=H THEN E=C2:RETURN
2090 IF Z=C4 AND A=C1 THEN E=C2:RETURN
2100 RETURN
2110 IF E>C0 GOTO 2170
2120 IF Z=C1 THEN B=B+C1:RETURN
2130 IF Z=C2 THEN A=A+C1:RETURN
2140 IF Z=C3 THEN B=B-C1:RETURN
2150 IF Z=C4 THEN A=A-C1:RETURN
2160 PRINT CHR$($13) CHR$($11) CHR$($11) CHR$($11) CHR$($11) CHR$($11);
2161 PRINT CHR$($11) CHR$($11) CHR$($11) CHR$($11) CHR$($11);
2162 PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2163 PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);:RETURN
2170 IF E=C0 GOTO 2190
2180 PRINT CHR$($A5);
2190 S=C1
2200 RETURN
2209 REM MOVE FORWARD?
2210 A=X:B=Y
2220 GOSUB 1940
2230 GOSUB 2110
2240 X=A:Y=B
2250 IF E>C0 GOTO 1650
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
2380 GOTO 2400
2390 GOSUB 2160:PRINT"{UP}{UP}"CHR$($1D)CHR$($1D)"YOU'RE OUTSIDE!"
2400 GOTO 1650
2410 ON T GOTO 2420,2780,3220,3710,4250

2420 REM DISPLAY DEPTH 1 - CLOSEST TO PLAYER
2430 PRINT CHR$($93);: REM CLEAR SCREEN
2440 IF E>C2 THEN RETURN
2450 IF E<C0 OR E>C1 THEN GOSUB 2180:RETURN
2460 FOR I=C1 TO 21
2465 IF C=C1 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2466 IF C=C1 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($A7);:GOTO 2520
2470 IF Y=C0 THEN PRINT CHR$($1D) CHR$($12)MID$(W$,(I AND C1)+C1,C8);:GOTO 2520
2480 IF EL=C1 THEN PRINT CHR$($1D) CHR$($A7) CHR$($A7) CHR$($A7) CHR$($A7);
2481 IF EL=C1 THEN PRINT CHR$($A7) CHR$($A7) CHR$($A7) CHR$($A7);:GOTO 2520
2490 IF I=C2 THEN PRINT CHR$($1D) CHR$($A4) CHR$($A4) CHR$($A4) CHR$($A4);
2491 IF I=C2 THEN PRINT CHR$($A4) CHR$($A4) CHR$($A4) CHR$($A6);:GOTO 2520
2500 IF I<18 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2501 IF I<18 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($A6);:GOTO 2520
2510 PRINT CHR$($1D) CHR$($12)"       "CHR$($92)CHR$($A6);
2520 IF E=C0 THEN PRINT SPC(22);:GOTO2550
2530 IF Y=C0 THEN PRINT CHR$($12) MID$(W$,(I AND C1)+C1,22);:GOTO 2550
2540 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2541 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2542 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2543 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2550 IF D=C1 THEN PRINT CHR$($A5): GOTO 2610
2560 IF Y=C0 THEN PRINT CHR$($12) MID$(W$,(I AND C1)+C1,C8):GOTO 2610
2570 IF ER=C1 THEN PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
2571 IF ER=C1 THEN PRINT CHR$($A6) CHR$($A6) CHR$($A6): GOTO 2610
2580 IF ER=C2 THEN PRINT CHR$($A6) CHR$($A4) CHR$($A4) CHR$($A4) CHR$($A4);
2581 IF ER=C2 THEN PRINT CHR$($A4) CHR$($A4) CHR$($A4): GOTO 2610
2590 IF I<18 THEN PRINT CHR$($A6):GOTO2610
2600 PRINT CHR$($A6)CHR$($12)"       "
2610 NEXT
2620 FOR I=C1 TO C3:IF C=C1 OR(X=WANDY=C0)GOTO 2680
2630 IF I<>C1 THEN 2650
2640 IF EL=C0 THEN PRINT CHR$($1D) CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3);
2641 IF EL=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($CE);
2642 IF EL=C0 THEN GOTO 2690
2650 PRINT CHR$($1D) CHR$($12) LEFT$(SP$,C8-I) CHR$($CE) LEFT$(SP$,I-C1);
2660 IF I=C1 GOTO 2690
2670 GOTO 2700
2672 PRINT CHR$($96);: REM CHANGE COLOUR TO LIGHT RED FOR TROUBLESHOOT
2680 PRINT SPC(C9-I)CHR$($12)CHR$($A9)LEFT$(SP$,I-C1);:IF I<>C1 THEN 2700
2690 IF E=C0 THEN PRINT CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2691 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2692 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2693 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
2694 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3);:GOTO 2710
2700 PRINT CHR$($12)"                      ";
2710 IF D=C1 OR(X=W AND Y=C0)GOTO 2750
2720 IF I<>C1 THEN 2740
2725 REM DRAW CENTER FLOOR AND LEFT AND RIGHT FLOOR
2726 PRINT CHR$($96);: REM CHANGE COLOUR TO LIGHT RED FOR TROUBLESHOOT
2730 IF ER=C0 THEN PRINT CHR$($12)CHR$($CD)CHR$($A3)CHR$($A3)CHR$($A3);
2731 IF ER=C0 THEN PRINT CHR$($A3)CHR$($A3)CHR$($A3)CHR$($A3):GOTO 2760
2740 PRINT CHR$($12) LEFT$(SP$,I-C1) CHR$($CD)LEFT$(SP$,C8-I):GOTO 2760
2750 PRINT CHR$($12) LEFT$(SP$,I-C1) CHR$($DF)
2760 NEXT I
2765 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
2770 RETURN

2780 REM DISPLAY DEPTH 2
2790 PRINT CHR$($13);:Z$=CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)
2791 Z$=Z$+CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)
2800 FOR I=C1 TO C2:PRINT Z$;:IF C=C0 GOTO 2830
2810 PRINT SPC(I+C1)CHR$($CD);SPC(C2-I);:GOTO 2860
2820 PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($CD);:GOTO 2860
2830 IF I=C1 THEN PRINT SPC(C4):GOTO 2860
2840 IF EL=C1 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);:GOTO 2860
2850 PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($A4);
2860 IF E=C0 OR I=C1 THEN PRINT SPC(14);:GOTO 2880
2865 REM DRAW A WALL BLOCKING PATH
2866 PRINT CHR$($96);: REM CHANGE COLOUR TO LIGHT RED FOR TROUBLESHOOT
2870 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
2871 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
2880 IF D=C0 GOTO 2900
2890 PRINT SPC(C2-I)CHR$($CE):GOTO 2930
2900 IF I=C1 THEN PRINT:GOTO 2930
2910 IF ER=C1 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4):GOTO 2930
2920 PRINT CHR$($A4)
2930 NEXT
2940 FOR I=C1 TO 15
2941 PRINT Z$;
2942 IF C=C1 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($A7);:GOTO2990
2945 REM DRAW A WALLING BLOCKING PATH
2950 IF EL=C1 THEN PRINT CHR$($12) CHR$($A6) CHR$($A6) CHR$($A6);
2951 IF EL=C1 THEN PRINT CHR$($A6) CHR$($92);: GOTO 2990
2960 IF I=C3 THEN PRINT CHR$($A4) CHR$($A4) CHR$($A4) CHR$($12);
2961 IF I=C3 THEN PRINT CHR$($A6) CHR$($92);: GOTO 2990
2970 IF I>12 THEN PRINT CHR$($12)"   " CHR$($A6) CHR$($92);: GOTO 2990
2975 REM DRAW CENTER PASSAGE AND PASSAGE TO LEFT
2980 PRINT"   "CHR$($12)CHR$($A6)CHR$($92);
2990 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2991 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
2992 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);:GOTO 3010
3000 PRINT CHR$($12) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
3001 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6) CHR$($A6);
3002 PRINT CHR$($A6) CHR$($A6) CHR$($A6) CHR$($92);
3010 IF D=C1 THEN PRINT CHR$($A5):GOTO 3060
3015 REM DRAW CENTER PASSAGE AND PASSAGE TO RIGHT
3020 IF ER=C1THEN PRINT CHR$($12)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6):GOTO 3060
3030 IF I=C3 THEN PRINT CHR$($12)CHR$($A6)CHR$($92);
3031 IF I=C3 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4):GOTO 3060
3040 IF I>12 THEN PRINT CHR$($12)CHR$($A6)"   ":GOTO 3060
3050 PRINT CHR$($12)CHR$($A6)
3060 NEXT
3070 FOR I=C1 TO 4:PRINT Z$;:IF C=C1 GOTO 3120
3080 IF I<>C1 GOTO 3110
3085 REM DRAW CENTER FLOOR AND LEFT PASSAGE FLOOR
3090 IF EL=C0 THEN PRINTCHR$($12)CHR$($A3)CHR$($A3)CHR$($A3)CHR$($CE);:GOTO3130
3100 PRINT CHR$($12)"   "CHR$($CE);:GOTO 3130
3110 PRINT CHR$($12)LEFT$(SP$,C4-I)CHR$($CE)LEFT$(SP$,I-C1);:GOTO 3140
3120 PRINT SPC(C4-I)CHR$($12)CHR$($A9)LEFT$(SP$,I-C1);:IF I<>C1 THEN 3140
3130 IF E=C0 THEN PRINT CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3131 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3132 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3133 IF E=C0 THEN PRINT  CHR$($A3);:GOTO 3150
3140 PRINT CHR$($12)"              ";:REM ROW 2,3,4 IN THIS SECTION
3150 IF D=C1 GOTO 3190
3160 IF I<>C1 THEN 3180
3165 REM DRAW PART OF CENTER FLOOR AND RIGHT PASSAGE FLOOR
3170 IF ER=C0 THEN PRINTCHR$($12)CHR$($CD)CHR$($A3)CHR$($A3)CHR$($A3):GOTO 3200
3180 PRINT CHR$($12) LEFT$(SP$,I-C1)CHR$($CD)LEFT$(SP$,C4-I):GOTO 3200
3190 PRINT CHR$($12) LEFT$(SP$,I-C1)CHR$($DF):GOTO 3200
3200 NEXT I
3205 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
3210 RETURN

3220 REM DISPLAY DEPTH 3
3225 PRINT CHR$($9B): REM CHANGE COLOUR TO LIGHT GREY
3230 PRINT CHR$($13)CHR$($11)CHR$($11);
3231 Z$=Z$+CHR$($1D)+CHR$($1D)+CHR$($1D)+CHR$($1D)
3240 FOR I=C1 TO 3:PRINT Z$;:IF C=C0 GOTO 3260
3250 PRINT SPC(I-C1)CHR$($CD)SPC(C3-I);:GOTO 3290
3260 IF I<C3 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D);:GOTO 3290
3270 IF EL=C1 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4);:GOTO 3290
3280 PRINT CHR$($1D)CHR$($1D)CHR$($A4);
3290 IF E=C0 OR I<=C2 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);
3291 IF E=C0 OR I<=C2 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);:GOTO3310
3300 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
3301 PRINT CHR$($A4)CHR$($A4);
3310 IF D=C0 GOTO 3330
3320 PRINT SPC(3-I)CHR$($CE):GOTO 3360
3330 IF I<C3 THEN PRINT:GOTO 3360
3340 IF ER=C1 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4):GOTO3360
3350 PRINT CHR$($A4)
3360 NEXT
3370 FOR I=C1 TO 9:PRINT Z$;
3371 IF C=C1 THEN PRINT CHR$($1D)CHR$($1D)CHR$($A7);:GOTO3420
3380 IF EL=C1 THEN PRINT CHR$($A6)CHR$($A6)CHR$($A6);:GOTO3420
3390 IF I=C2 THEN PRINT CHR$($A4)CHR$($A4)CHR$($A4);:GOTO3420
3400 IF I>C7 THEN PRINT CHR$($12)"  "CHR$($92)CHR$($A6);:GOTO3420
3410 PRINT"  "CHR$($A6);
3420 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D) CHR$($1D);
3421 IF E=C0 THEN PRINT CHR$($1D) CHR$($1D) CHR$($1D);:GOTO 3440
3430 PRINT CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6);
3431 PRINT CHR$($A6);
3440 IF D=C1 THEN PRINT CHR$($A5):GOTO3490
3450 IF ER=C1 THEN PRINT CHR$($A6)CHR$($A6)CHR$($A6):GOTO 3490
3460 IF I=C2 THEN PRINT CHR$($A6)CHR$($A4)CHR$($A4):GOTO 3490
3470 IF I>C7 THEN PRINT CHR$($A6)CHR$($12)"  "CHR$($92):GOTO 3490
3480 PRINT CHR$($A6)
3490 NEXT I: REM LOOP 3370
3500 FOR I=C1 TO 3:PRINT Z$;:IF C=C1 GOTO 3560
3510 IF I<>C1 THEN 3530
3520 IF EL=C0 THEN PRINT CHR$($12)CHR$($A3)CHR$($A3)CHR$($CE);:GOTO 3570
3530 PRINT CHR$($12) LEFT$(SP$,C3-I)CHR$($CE)LEFT$(SP$,I-C1);
3540 IF I=C1 THEN 3570
3550 GOTO 3580
3560 PRINT SPC(C3-I) CHR$($12)CHR$($A9)LEFT$(SP$,I-C1);:GOTO 3540
3570 IF E=C0 THEN PRINT CHR$($12) CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);
3571 IF E=C0 THEN PRINT CHR$($A3) CHR$($A3) CHR$($A3) CHR$($A3);:GOTO 3590
3580 PRINT CHR$($12)"        ";
3590 IF D=C1 GOTO 3650
3600 IF I<>C1 THEN 3620
3610 IF ER=C0 THEN PRINT CHR$($12)CHR$($CD)CHR$($A3)CHR$($A3):GOTO 3690
3620 PRINT CHR$($12)LEFT$(SP$,I-C1) CHR$($12)CHR$($CD)LEFT$(SP$,C3-I):GOTO 3690
3650 PRINT CHR$($12)LEFT$(SP$,I-C1) CHR$($DF)
3690 NEXT I
3695 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
3700 RETURN

3710 REM DISPLAY DEPTH 4
3715 PRINT CHR$($98): REM CHANGE COLOUR TO MEDIUM GREY
3720 PRINT CHR$($13) CHR$($11) CHR$($11) CHR$($11) CHR$($11) CHR$($11);
3721 Z$=Z$+CHR$($1D)+CHR$($1D)+CHR$($1D)
3730 FOR I=C1 TO 2:PRINT Z$;:IF C=C0 GOTO 3770
3740 PRINT SPC(I-C1)CHR$($CD) SPC(C2-I);:GOTO 3810
3770 IF I=C1 THEN PRINT CHR$($1D) CHR$($1D);:GOTO 3810
3790 IF EL=C1 THEN PRINT CHR$($A4)CHR$($A4);:GOTO 3810
3800 PRINT CHR$($1D)CHR$($A4);
3810 IF E=C0 OR I=C1 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);:GOTO 3830
3820 PRINT CHR$($A4)CHR$($A4)CHR$($A4)CHR$($A4);
3830 IF D=C0 GOTO 3870
3840 IF I=C1 THEN PRINT CHR$($1D);
3850 PRINT CHR$($CE):GOTO 3910
3870 IF I=C1 THEN PRINT:GOTO 3910
3890 IF ER=C1 THEN PRINT CHR$($A4)CHR$($A4):GOTO 3910
3900 PRINT CHR$($A4)
3910 NEXT
3920 FOR I=C1 TO 5:PRINT Z$;:IF C=C1 THEN PRINT CHR$($1D)CHR$($A7);:GOTO 3970
3930 IF EL=C1 THEN PRINT CHR$($12)CHR$($A6)CHR$($A6)CHR$($92);:GOTO 3970
3940 IF I=C1 THEN PRINT CHR$($A4) CHR$($12)CHR$($A6)CHR$($92);:GOTO 3970
3950 IF I>4 THENP RINT CHR$($12)CHR$($A3)CHR$($A6)CHR$($92);:GOTO 3970
3960 PRINT" "CHR$($12)CHR$($A6)CHR$($92);
3970 IF E=C0 THEN PRINT CHR$($1D)CHR$($1D)CHR$($1D)CHR$($1D);:GOTO 3990
3980 PRINT CHR$($12)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($A6)CHR$($92);
3990 IF D=C1 THEN PRINT CHR$($A5):GOTO 4040
4000 IF ER=C1 THEN PRINT CHR$($12)CHR$($A6) CHR$($A6):GOTO 4040
4010 IF I=C1 THEN PRINT CHR$($12) CHR$($A6) CHR$($92) CHR$($A4):GOTO 4040
4020 IF I>C4 THEN PRINT CHR$($12) CHR$($A6)" ":GOTO 4040
4030 PRINT CHR$($12)CHR$($A6)
4040 NEXT
4050 FORI=C1TO2:PRINTZ$;:IFC=C1GOTO4100
4060 IF I<>C1 THEN 4080
4070 IF EL=C0 THEN PRINT CHR$($12)CHR$($A3)CHR$($CE);:GOTO4130
4080 PRINT CHR$($12) LEFT$(SP$,C2-I)CHR$($CE)LEFT$(SP$,I-C1);
4085 IF I=C1 THEN 4130
4090 GOTO 4140
4100 IF I=C1 THEN PRINT CHR$($1D);
4110 PRINT CHR$($12)CHR$($A9);
4120 IF I=C2 THEN PRINT" ";:GOTO 4140
4130 IF E=C0 THEN PRINTCHR$($12)CHR$($A3)CHR$($A3)CHR$($A3)CHR$($A3);:GOTO 4150
4140 PRINT CHR$($12)"    ";
4150 IF D=C1 GOTO 4200
4160 IF I<>C1 THEN 4180
4170 IF ER=C0 THEN PRINT CHR$($12)CHR$($CD)CHR$($A3):GOTO 4230
4180 PRINT CHR$($12) LEFT$(SP$,I-C1)" "LEFT$(SP$,C2-I):GOTO 4230
4200 PRINT CHR$($12);:IF I=C2 THEN PRINT" ";
4210 PRINT CHR$($DF)
4230 NEXT I
4235 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
4240 RETURN

4250 REM DISPLAY DEPTH 5 - FURTHEST FROM PLAYER
4255 PRINT CHR$($97): REM CHANGE COLOUR TO DARK GREY
4260 PRINT CHR$($13)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11)CHR$($11);
4261 PRINT CHR$($11);:Z$=Z$+CHR$($1D)+CHR$($1D)
4270 PRINT Z$;:IF C=C0 GOTO 4290
4280 PRINT CHR$($CD);:GOTO 4300
4290 PRINT CHR$($A4);
4300 IF E=C0 THEN PRINT CHR$($1D)CHR$($1D);:GOTO 4320
4310 PRINT CHR$($A4)CHR$($A4);
4320 IF D=C0 GOTO 4340
4330 PRINT CHR$($CE):GOTO 4350
4340 PRINT CHR$($A4)
4350 FOR I=C1 TO 3:PRINT Z$;:IF C=C1 GOTO 4370
4360 PRINT CHR$($A6);:GOTO 4380
4370 PRINT CHR$($A7);
4380 IF E=C0 THEN PRINT CHR$($1D)CHR$($1D);:GOTO 4400
4390 PRINT CHR$($A6)CHR$($A6);
4400 IF D=C0 THEN PRINT CHR$($A6):GOTO 4420
4410 PRINT CHR$($A5)
4420 NEXT
4430 PRINT Z$;:IF C=C1 GOTO 4450
4440 PRINT CHR$($12)CHR$($CE);:GOTO 4460
4450 PRINT CHR$($12)CHR$($A9);
4460 IF E=C1 THEN PRINT CHR$($12)"  ";:GOTO 4480
4470 PRINT CHR$($12)CHR$($A3)CHR$($A3);
4480 IF D=C1 GOTO 4500
4490 PRINT CHR$($12)CHR$($CD):GOTO4510
4500 PRINT CHR$($12) CHR$($DF)
4505 PRINT CHR$($05): REM CHANGE COLOUR TO WHITE
4510 RETURN

4590 FOR I=0 TO 10:FOR J=0 TO 19
4600 PRINT RIGHT$("0"+MID$(STR$(A(J,I)),2),2)CHR$($1D);:NEXT J:PRINT:NEXT I
4610 PRINT:PRINT
4620 FOR J=V-1 TO 0 STEP-1:FOR I=1 TO H
4630 PRINT RIGHT$("0"+MID$(STR$(B(I,J)),2),2)CHR$($1D);:NEXT I:PRINT:NEXT J

10000 REM LABYRINTH BY COMMODORE, UPDATED FOR X16 BY JUSTIN BALDOCK
10005 REM https://github.com/JustinBaldock/X16-Labyrinth
10010 REM VARIABLES
10020 REM H=HORIZONTAL, ENTERED BY USER AT START
10030 REM V=VERTICAL, ENTERED BY USER AT START
10031 REM Z=DIRECTION VIEWING. VALID 1-4.
10040 REM https://www.c64-wiki.com/wiki/PETSCII_Codes_in_Listings
10050 REM SCREEN($00)
10060 REM CONSTANTS
10070 C0=0:C1=1:C2=2:C3=3:C4=4:C5=5:C6=6:C7=7:C8=8:C9=9
10080 REM SC=1024: REM SCREEN MEMORY?
10090 REM LL=40: REM COLUMS PER ROW
10100 DIM A(19,11),B(19,11)
10110 A$(1)="NORTH":A$(2)="EAST":A$(3)="SOUTH":A$(4)="WEST"
10120 W$=CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10130 W$=W$+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10140 W$=W$+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10150 W$=W$+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)+CHR$($B1)+CHR$($B2)
10160 SP$="                                               "
10170 LET X6=1: REM X16=1, C64=0
10180 IF X6=1 THEN SC=0000: REM X16 SCREEN RAM ADDRESS
10190 IF X6=0 THEN SC=1024: REM C64 SCREEN RAM ADDRESS
10200 IF X6=1 THEN LL=128
10210 IF X6=0 THEN LL=40
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
50025 REM DISPLAY ARRAY B
50027 PRINT "ARRAY B"
50030 FOR I=V TO 1 STEP -1
50040 FOR J=1 TO H
50050 PRINT B(J,I);
50060 NEXT J
50070 PRINT
50080 NEXT I
50085 PRINT "ARRAY A"
50090 REM DISPLAY ARRAY A
50100 FOR I=V TO 1 STEP -1
50110 FOR J=1 TO H
50120 PRINT A(J,I);
50130 NEXT J: PRINT: NEXT I
50300 RETURN
