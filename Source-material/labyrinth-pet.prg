0 goto1000
1 rem labyrinth
2 :
3 rem author unknown         april 83         source commodore canada
4 :
5 rem find your way through a labyrinth       good graphics
6 :
7 rem pet 16k
8 :
9 rem modified for softswap by j lewis
10 rem"{CM A}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{CM S}
11 rem"{SH -}       san mateo county      {SH -}
12 rem"{SH -}     office of education     {SH -}
13 rem"{SH -}             &               {SH -}
14 rem"{SH -}  computer-using educators   {SH -}
15 rem"{SH -}                             {SH -}
16 rem"{SH -}          softswap           {SH -}
17 rem"{SH -}                             {SH -}
18 rem"{SH -}333 main street, redwood city{SH -}
19 rem"{SH -}ca 94063        (415)363-5472{SH -}
20 rem"{CM Z}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{CM X}
21 rem"{CM A}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{CM S}
22 rem"{SH -} programs may be copied for  {SH -}
23 rem"{SH -} educational use only and    {SH -}
24 rem"{SH -} are not to be sold.         {SH -}
25 rem"{SH -} copyright 1983    cue inc.  {SH -}
26 rem"{CM Z}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{CM X}
30 rem"{CM I}{CM I}{CM I}input routine
32 deffnz(z)=peek(196)+256*peek(197)+peek(198):poke158,0:zz$="":poke167,0
34 getz$:ifz$=""orz$="{CLEAR}"orz$="{HOME}"orz$="{DOWN}"orz$="{UP}"orz$="{RIGHT}"orz$="{LEFT}"orz$="{148}"then34
36 ifz$=chr$(13)thenpoke167,1:pokefnz(z),32:z$=zz$:print:goto44
38 if(zz$=""andz$=chr$(20))then32
40 ifzcandlen(zz$)>zc-1thengosub46:goto32
42 zz$=zz$+z$:zz$=left$(zz$,len(zz$)+(chr$(20)=z$)*2):printz$;:goto34
44 zc=0:return
46 forzx=1tozc:printchr$(20);:next:return
50 rem"{CM I}{CM I}{CM I}get routine
52 getz$:printmid$(" {LEFT}{CM P}{LEFT}",(zu+1)*2-1,2);:zu=-1*(zu=0):ifz$=""then52
54 ifzc$<>""thenforzx=1tolen(zc$):zf=zf+zx*-(z$=mid$(zc$,zx,1)):next:ifzf=0then52
56 zc$="":zf=0:return
60 rem"{CM I}{CM I}{CM I}continue routine
61 getz$:printmid$(" {LEFT}*{LEFT}",(zu+1)*2-1,2);:zu=-1*(zu=0):ifz$<>chr$(13)then61
62 return
1000 print"{CLEAR}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}          {CM A}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{CM S}"
1001 print"          {SH -}                   {SH -}"
1002 print"          {SH -} l a b y r i n t h {SH -}"
1003 print"          {SH -}                   {SH -}"
1004 print"          {CM Z}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{SH ASTERISK}{CM X}"
1006 zb$="20>:??:9??8=9;004<31>6":zb=813:sk=230:ifpeek(50003)=1then1008
1007 zb$="20>:??:9??8=9;004<58>4":zb=852:sk=228
1008 forza=1to11:pokeza+zb,asc(mid$(zb$,za*2-1))*16+asc(mid$(zb$,za*2))-816
1009 nextza:poke145,3
1100 dima(19,12),b(19,12):k=1:l=2:n=3
2000 poke59468,12
2030 g=rnd(ti)
2070 a$(1)="North":a$(2)="East":a$(3)="South":a$(4)="West"
2080 w$="{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}{CM E}{CM R}"
2140 rem
2160 rem clear maze array
2170 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2180 m1=0:fori=0to19:forj=0to10:a(i,j)=0:b(i,j)=0:nextj,i:print"{CLEAR}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}"
2190 print"{CLEAR}":gosub9100
2195 print"{HOME}{DOWN}type width of the labyrinth (2-19)?     {LEFT}{LEFT}{LEFT}{LEFT}";:zc=2:gosub30:ur$=z$
2196 ifz$="*"then9500
2200 h=val(ur$):ifh<lorh>19then2195
2205 print
2210 print"type depth of the labyrinth (1-11)?     {LEFT}{LEFT}{LEFT}{LEFT}";:zc=2:gosub30:ur$=z$
2211 ifz$="*"then9500
2220 v=val(ur$):ifv=0orv>11thenprint"{UP}{UP}";:goto2210
2230 print"{CLEAR}{DOWN}now creating a"h"V"v"labyrinth"
2240 a=h*v+k
2250 q=0:g=0:x=int(h*rnd(h))+k
2260 rem save maze entry point
2270 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2280 aa=x
2290 a(x,0)=k:c=l
2300 r=x:s=k:goto2390
2310 rem start of maze build routine
2320 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2330 ifr<>hgoto2370
2340 ifs<>vgoto2360
2350 r=k:s=k:goto2380
2360 r=k:s=s+k:goto2380
2370 r=r+k
2380 ifa(r,s-k)=0goto2330
2390 ifr-k=0goto2830
2400 ifa(r-k,s-k)goto2830
2410 ifs-k=0goto2610
2420 ifa(r,s-l)goto2610
2430 ifr=hgoto2490
2440 ifa(r+k,s-k)goto2490
2450 rem left/down/right
2460 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2470 x=int(3*rnd(1))+k
2480 onxgoto3240,3300,3360
2490 ifs<>vgoto2520
2500 ifg=kgoto2590
2510 q=k:goto2550
2520 ifa(r,s)goto2590
2530 rem left/down/up
2540 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2550 x=int(3*rnd(1))+k
2560 onxgoto3240,3300,3450
2570 rem left/down
2580 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2590 x=int(2*rnd(1))+k
2600 goto2560
2610 ifr=hgoto2750
2620 ifa(r+k,s-k)goto2750
2630 ifs<>vgoto2660
2640 ifg=kgoto2730
2650 q=k:goto2690
2660 ifa(r,s)goto2730
2670 rem left/right/up
2680 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2690 x=int(3*rnd(1))+k
2700 onxgoto3240,3360,3450
2710 rem left/right
2720 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2730 x=int(2*rnd(1))+k
2740 goto2700
2750 ifs<>vgoto2780
2760 ifg=kgoto3240
2770 q=k:goto2810
2780 ifa(r,s)goto3240
2790 rem left/up
2800 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2810 x=int(2*rnd(1))+k
2820 onxgoto3240,3450
2830 ifs-k=0goto3070
2840 ifa(r,s-l)goto3070
2850 ifr=hgoto2990
2860 ifa(r+k,s-k)goto2990
2870 ifs<>vgoto2900
2880 ifg=kgoto2970
2890 q=k:goto2930
2900 ifa(r,s)goto2970
2910 rem down/right/up
2920 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2930 x=int(3*rnd(1))+k
2940 onxgoto3300,3360,3450
2950 rem down/right
2960 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
2970 x=int(2*rnd(1))+k
2980 goto2940
2990 ifs<>vgoto3020
3000 ifg=kgoto3300
3010 q=k:goto3050
3020 ifa(r,s)goto3300
3030 rem down/up
3040 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3050 x=int(2*rnd(1))+k
3060 onxgoto3300,3450
3070 ifr=hgoto3170
3080 ifa(r+k,s-k)goto3170
3090 ifs<>vgoto3120
3100 ifg=kgoto3360
3110 q=k:goto3150
3120 ifa(r,s)goto3360
3130 rem right/up
3140 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3150 x=int(2*rnd(1))+k
3160 onxgoto3360,3450
3170 ifs<>vgoto3200
3180 ifg=kgoto2330
3190 q=k:goto3210
3200 ifa(r,s)goto2330
3210 goto3450
3220 rem left
3230 rem"{CM U}{CM U}{CM U}{CM U}
3240 a(r-k,s-k)=c
3250 c=c+k:b(r-k,s-k)=l:r=r-k
3260 ifc=agoto3590
3270 q=0:goto2390
3280 rem down
3290 rem"{CM U}{CM U}{CM U}{CM U}
3300 a(r,s-l)=c
3310 c=c+k
3320 b(r,s-l)=k:s=s-k:ifc=agoto3590
3330 q=0:goto2390
3340 rem right
3350 rem"{CM U}{CM U}{CM U}{CM U}{CM U}
3360 a(r+k,s-k)=c
3370 c=c+k:ifb(r,s-k)=0goto3390
3380 b(r,s-k)=n:goto3400
3390 b(r,s-k)=l
3400 r=r+k
3410 ifc=agoto3590
3420 goto2830
3430 rem up
3440 rem"{CM U}{CM U}
3450 ifq=kgoto3530
3460 a(r,s)=c:c=c+k:ifb(r,s-k)=0goto3480
3470 b(r,s-k)=n:goto3490
3480 b(r,s-k)=k
3490 s=s+k:ifc=agoto3590
3500 goto2390
3510 rem exit at top of screen
3520 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3530 g=k
3540 ifb(r,s-k)=0goto3560
3550 b(r,s-k)=n:q=0:goto2330
3560 b(r,s-k)=k:q=0:r=k:s=k:goto2380
3570 rem make exit if not there
3580 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3590 ifg<>kthenx=int(h*rnd(k))+k:b(x,v-k)=b(x,v-k)+k
3600 rem end of maze build
3610 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3620 print"{CLEAR}":gosub9100
3625 print"{HOME}{DOWN}do you want to see the labryinth? (y/n)";:zc$="yn*":gosub50:g$=z$
3626 ifg$="n"thenx=ti:goto4010
3627 ifg$="*"then9500
3630 print"{CLEAR}{DOWN}you have"h+v"seconds to look at it!":gosub4620
3640 gosub3650:poke33266-h+40*v+l*aa,30:goto4000
3650 m1=k:print"{CLEAR}{DOWN}";
3660 g$="":ifh<>19thenfori=kto19-h:g$=g$+"{RIGHT}":next
3670 ifv<>11thenfori=kto11-v:print"{DOWN}";:next
3680 rem 2d display routine
3690 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3700 forj=vto1step-k
3710 printg$;:fori=ktoh
3720 ifb(i,j-k)=0goto3780
3730 ifb(i,j-k)=lgoto3780
3740 rem print top of cells
3750 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3760 print"{SH +} ";
3770 goto3790
3780 print"{SH +}{SH ASTERISK}";
3790 nexti
3800 print"{SH +}"
3810 printg$;:print"{SH -}";
3820 fori=ktoh
3830 ifb(i,j-k)<lgoto3880
3840 rem print sides of cells
3850 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3860 print"  ";
3870 goto3890
3880 print" {SH -}";
3890 nexti
3900 print
3910 nextj
3920 printg$;:fori=ktoh
3930 ifi=aagoto3970
3940 rem print bottom of maze
3950 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
3960 print"{SH +}{SH ASTERISK}";:goto3980
3970 print"{SH +} ";
3980 nexti
3990 print"{SH +}":return
4000 x=ti+(h+v)*60
4010 rem translate routine
4020 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4030 rem fori=1toh:forj=0tov-1
4040 rem a(i,j)=(3-b(i,j))*2
4050 rem nextj,i
4060 w=aa
4070 rem complete cell information
4080 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4090 forj=0tov-k
4100 fori=ktoh
4110 ifjgoto4140
4120 ifi=wthena(i,j)=(3-b(i,j))*l:goto4160
4130 m=k:goto4150
4140 m=(a(i,j-k)and2)/l
4150 a(i,j)=(3-b(i,j))*l+m*8
4160 ifi=kthenm=k:goto4180
4170 m=(a(i-k,j)and4)/4
4180 a(i,j)=a(i,j)+m
4190 nexti
4200 nextj
4210 rem set up start params
4220 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4230 ifx>tigoto4230
4250 x=w:y=0:g=k:el=k:er=k
4260 goto5370
4350 rem help routine
4360 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4370 print"{CLEAR}":poke59468,14:gosub3650
4375 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}You are here {CM +}, facing "a$(g);
4380 poke33306-h+40*v+l*x-80*y,102
4390 rem get instructions
4400 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4410 ify>vgoto8100
4411 ifpeek(59468)=14thenprint"{HOME}Command: ";:goto4430
4415 ifpeek(59468)=14thengosub9000:print"{HOME}Command: ";:goto4430
4420 gosub9000:print"{HOME}command:   {LEFT}{LEFT}";
4430 zc$="rlfhq":gosub50:g$=z$
4440 ifg$="q"then9500
4450 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}         ";
4460 ifg$="l"goto4530
4470 ifg$="r"goto4570
4480 ifg$="f"goto5300
4490 ifg$="h"goto4370
4500 goto4440
4510 rem left turn
4520 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4530 g=g-k:ifg<ktheng=g+4
4540 goto5370
4550 rem right turn
4560 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4570 g=g+k:ifg>4theng=g-4
4580 goto5370
4590 return
4600 rem pause
4610 rem"{CM U}{CM U}{CM U}{CM U}{CM U}
4620 i=ti+200
4630 ifi>tigoto4630
4640 return
4650 rem rotate lh cell and look
4660 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4670 ifg=kthena1=a-k:b1=b-k:goto4720
4680 ifg=landb<vthena1=a:b1=b:goto4720
4690 ifg=nthena1=a+k:b1=b-k:goto4720
4700 ifg=4andb>kthena1=a:b1=b-l:goto4720
4710 el=k:return
4720 f=a(a1,b1):ifg=kgoto4740
4730 fori=ltog:f=(fand14)/l+(fand1)*8:next
4740 el=(fand2)/l:return
4750 rem rotate rh cell and look
4760 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4770 ifg=kthena1=a+k:b1=b-k:goto4820
4780 ifg=landb>kthena1=a:b1=b-l:goto4820
4790 ifg=nthena1=a-k:b1=b-k:goto4820
4800 ifg=4andb<vthena1=a:b1=b:goto4820
4810 er=k:return
4820 f=a(a1,b1):ifg=kgoto4840
4830 fori=ltog:f=(fand14)/l+(fandk)*8:next
4840 er=(fand2)/l:return
4850 rem rotate and look routine
4860 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4870 ifb=0goto4970
4880 ifb>vthene=n:return
4890 f=a(a,b-k):ifg=kgoto4910
4900 fori=ltog:f=(fand14)/l+(fand1)*8:next
4910 c=fandk:d=(fand4)/4:e=(fand2)/l
4920 ifc=0thengosub4650
4930 ifd=0thengosub4750
4940 return
4950 rem charside maze
4960 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
4970 c=0:d=0:e=-k
4980 ifg<>kgoto5040
4990 e=k
5000 ifa=wthene=0
5010 return
5020 rem no man's land
5030 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5040 ifg=nthene=l:return
5050 ifg=landa=hthene=l:return
5060 ifg=4anda=kthene=l:return
5070 return
5080 rem index to next cell
5090 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5100 ife>0goto5180
5110 ifg=kthenb=b+k:return
5120 ifg=lthena=a+k:return
5130 ifg=nthenb=b-k:return
5140 ifg=4thena=a-k:return
5150 rem message routine
5160 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5170 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:return
5180 ife=0goto5230
5190 gosub5170:print"you'll hit the wall"
5200 gosub5170:ifc=0andd=0andbthenprint"{DOWN}{DOWN}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}turn":goto5260
5210 ifc=kor(b=0anda<w)thenprint"{DOWN}{DOWN}{RIGHT}{RIGHT}{RIGHT}{RIGHT}turn right":goto5260
5220 print"{DOWN}{DOWN}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}turn left":goto5260
5230 gosub8220:print"{UP}{UP}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*    no     *
5240 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*   man's   *
5250 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*   land    *
5260 s=k
5270 return
5280 rem forward routine
5290 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5300 a=x:b=y
5310 gosub4870
5320 gosub5100
5330 x=a:y=b
5340 ife>0goto4410
5350 rem 3d display routine
5360 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5370 a=x:b=y
5380 gosub4870
5390 rem 5 depths
5400 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5410 fort=kto5
5420 gosub5570
5430 rem check for next depth
5440 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5450 ifethent=5:goto5490
5460 gosub5100
5470 gosub4870
5480 ife>kthent=5:goto5490
5490 nextt
5500 ifx=wandy=0andg=kthengosub8270:print"{UP}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*  way  in  *":goto5540
5510 ifx<>wandy=0andg=kthengosub5170:print"{UP}{UP}{UP}{UP}{RIGHT}{RIGHT}{RIGHT}external wall":goto5530
5520 goto5540
5530 gosub5170:print"{UP}{UP}{RIGHT}{RIGHT}you're outside!
5540 goto4410
5550 rem jump to display depth
5560 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5570 ontgoto5580,6030,6660,7270,7820
5580 rem display depth 1
5590 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
5600 poke59468,12:print"{CLEAR}";
5610 ife>lthenreturn
5620 ife<0ore>kthengosub5230:return
5630 fori=kto21:ifc=kthenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{CM M}";:goto5690
5640 ify=0thenprint"{RIGHT}"mid$(w$,(iandk)+k,8);:goto5690
5650 ifel=kthenprint"{RIGHT}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}";:goto5690
5660 ifi=lthenprint"{RIGHT}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM +}";:goto5690
5670 ifi<18thenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{CM +}";:goto5690
5680 print"{RIGHT}{REVERSE ON}       {REVERSE OFF}{CM +}";
5690 ife=0thenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto5720
5700 ify=0thenprintmid$(w$,(iandk)+k,22);:goto5720
5710 print"{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}";
5720 ifd=kthenprint"{CM G}":goto5780
5730 ify=0thenprintmid$(w$,(iandk)+k,8):goto5780
5740 ifer=kthenprint"{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}":goto5780
5750 ifi=lthenprint"{CM +}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}":goto5780
5760 ifi<18thenprint"{CM +}":goto5780
5770 print"{CM +}{REVERSE ON}       "
5780 next
5790 fori=kton:ifc=kor(x=wandy=0)goto5850
5800 onigoto5810,5830,5840
5810 ifel=0thenprint"{RIGHT}{REVERSE ON}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}N";:goto5890
5820 print"{RIGHT}{REVERSE ON}       N";:goto5890
5830 print"{RIGHT}{REVERSE ON}      N ";:goto5900
5840 print"{RIGHT}{REVERSE ON}     N  ";:goto5900
5850 onigoto5860,5870,5880
5860 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{REVERSE ON}{SH POUND}";:goto5890
5870 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{REVERSE ON}{SH POUND} ";:goto5900
5880 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{REVERSE ON}{SH POUND}  ";:goto5900
5890 ife=0thenprint"{REVERSE ON}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}";:goto5910
5900 print"{REVERSE ON}                      ";
5910 ifd=kor(x=wandy=0)goto5970
5920 onigoto5930,5950,5960
5930 ifer=0thenprint"{REVERSE ON}M{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}":goto6010
5940 print"{REVERSE ON}M       ":goto6010
5950 print"{REVERSE ON} M      ":goto6010
5960 print"{REVERSE ON}  M     ":goto6010
5970 onigoto5980,5990,6000
5980 print"{REVERSE ON}{CM ASTERISK}":goto6010
5990 print"{REVERSE ON} {CM ASTERISK}":goto6010
6000 print"{REVERSE ON}  {CM ASTERISK}"
6010 nexti
6020 return
6030 rem display depth 2
6040 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
6050 print"{HOME}";:g$="{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}"
6060 fori=ktol:printg$;:ifc=0goto6100
6070 onigoto6080,6090
6080 print"{RIGHT}{RIGHT}M{RIGHT}";:goto6140
6090 print"{RIGHT}{RIGHT}{RIGHT}M";:goto6140
6100 onigoto6110,6120
6110 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto6140
6120 ifel=kthenprint"{CM @}{CM @}{CM @}{CM @}";:goto6140
6130 print"{RIGHT}{RIGHT}{RIGHT}{CM @}";
6140 ife=0ori=kthenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto6160
6150 print"{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}";
6160 ifd=0goto6200
6170 onigoto6180,6190
6180 print"{RIGHT}N":goto6240
6190 print"N":goto6240
6200 onigoto6210,6220
6210 print:goto6240
6220 ifer=kthenprint"{CM @}{CM @}{CM @}{CM @}":goto6240
6230 print"{CM @}"
6240 next
6250 fori=kto15:printg$;:ifc=kthenprint"{RIGHT}{RIGHT}{RIGHT}{CM M}";:goto6300
6260 ifel=kthenprint"{REVERSE ON}{CM +}{CM +}{CM +}{CM +}{REVERSE OFF}";:goto6300
6270 ifi=nthenprint"{CM @}{CM @}{CM @}{REVERSE ON}{CM +}{REVERSE OFF}";:goto6300
6280 ifi>12thenprint"{REVERSE ON}   {CM +}{REVERSE OFF}";:goto6300
6290 print"   {REVERSE ON}{CM +}{REVERSE OFF}";
6300 ife=0thenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto6320
6310 print"{REVERSE ON}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{REVERSE OFF}";
6320 ifd=kthenprint"{CM G}":goto6370
6330 ifer=kthenprint"{REVERSE ON}{CM +}{CM +}{CM +}{CM +}":goto6370
6340 ifi=nthenprint"{REVERSE ON}{CM +}{REVERSE OFF}{CM @}{CM @}{CM @}":goto6370
6350 ifi>12thenprint"{REVERSE ON}{CM +}   ":goto6370
6360 print"{REVERSE ON}{CM +}"
6370 next
6380 fori=kto4:printg$;:ifc=kgoto6450
6390 onigoto6400,6420,6430,6440
6400 ifel=0thenprint"{REVERSE ON}{CM T}{CM T}{CM T}N";:goto6500
6410 print"{REVERSE ON}   N";:goto6500
6420 print"{REVERSE ON}  N ";:goto6510
6430 print"{REVERSE ON} N  ";:goto6510
6440 print"{REVERSE ON}N   ";:goto6510
6450 onigoto6460,6470,6480,6490
6460 print"{RIGHT}{RIGHT}{RIGHT}{REVERSE ON}{SH POUND}";:goto6500
6470 print"{RIGHT}{RIGHT}{REVERSE ON}{SH POUND} ";:goto6510
6480 print"{RIGHT}{REVERSE ON}{SH POUND}  ";:goto6510
6490 print"{REVERSE ON}{SH POUND}   ";:goto6510
6500 ife=0thenprint"{REVERSE ON}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}";:goto6520
6510 print"{REVERSE ON}              ";
6520 ifd=kgoto6590
6530 onigoto6540,6560,6570,6580
6540 ifer=0thenprint"{REVERSE ON}M{CM T}{CM T}{CM T}":goto6640
6550 print"{REVERSE ON}M   ":goto6640
6560 print"{REVERSE ON} M  ":goto6640
6570 print"{REVERSE ON}  M ":goto6640
6580 print"{REVERSE ON}   M":goto6640
6590 onigoto6600,6610,6620,6630
6600 print"{REVERSE ON}{CM ASTERISK}":goto6640
6610 print"{REVERSE ON} {CM ASTERISK}":goto6640
6620 print"{REVERSE ON}  {CM ASTERISK}":goto6640
6630 print"{REVERSE ON}   {CM ASTERISK}"
6640 nexti
6650 return
6660 rem display depth 3
6670 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
6680 print"{HOME}{DOWN}{DOWN}";:g$=g$+"{RIGHT}{RIGHT}{RIGHT}{RIGHT}"
6690 fori=kton:printg$;:ifc=0goto6740
6700 onigoto6710,6720,6730
6710 print"M{RIGHT}{RIGHT}";:goto6780
6720 print"{RIGHT}M{RIGHT}";:goto6780
6730 print"{RIGHT}{RIGHT}M";:goto6780
6740 onigoto6750,6750,6760
6750 print"{RIGHT}{RIGHT}{RIGHT}";:goto6780
6760 ifel=kthenprint"{CM @}{CM @}{CM @}";:goto6780
6770 print"{RIGHT}{RIGHT}{CM @}";
6780 ife=0ori<=lthenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto6800
6790 print"{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}{CM @}";
6800 ifd=0goto6850
6810 onigoto6820,6830,6840
6820 print"{RIGHT}{RIGHT}N":goto6890
6830 print"{RIGHT}N":goto6890
6840 print"N":goto6890
6850 onigoto6860,6860,6870
6860 print:goto6890
6870 ifer=kthenprint"{CM @}{CM @}{CM @}":goto6890
6880 print"{CM @}"
6890 next
6900 fori=kto9:printg$;:ifc=kthenprint"{RIGHT}{RIGHT}{CM M}";:goto6950
6910 ifel=kthenprint"{CM +}{CM +}{CM +}";:goto6950
6920 ifi=lthenprint"{CM @}{CM @}{CM +}";:goto6950
6930 ifi>7thenprint"{REVERSE ON}  {REVERSE OFF}{CM +}";:goto6950
6940 print"  {CM +}";
6950 ife=0thenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto6970
6960 print"{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}{CM +}";
6970 ifd=kthenprint"{CM G}":goto7020
6980 ifer=kthenprint"{CM +}{CM +}{CM +}":goto7020
6990 ifi=lthenprint"{CM +}{CM @}{CM @}":goto7020
7000 ifi>7thenprint"{CM +}{REVERSE ON}  {REVERSE OFF}":goto7020
7010 print"{CM +}"
7020 next
7030 fori=kton:printg$;:ifc=kgoto7090
7040 onigoto7050,7070,7080
7050 ifel=0thenprint"{REVERSE ON}{CM T}{CM T}N";:goto7130
7060 print"{REVERSE ON}  N";:goto7130
7070 print"{REVERSE ON} N ";:goto7140
7080 print"{REVERSE ON}N  ";:goto7140
7090 onigoto7100,7110,7120
7100 print"{RIGHT}{RIGHT}{REVERSE ON}{SH POUND}";:goto7130
7110 print"{RIGHT}{REVERSE ON}{SH POUND} ";:goto7140
7120 print"{REVERSE ON}{SH POUND}  ";:goto7140
7130 ife=0thenprint"{REVERSE ON}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}{CM T}";:goto7150
7140 print"{REVERSE ON}        ";
7150 ifd=kgoto7210
7160 onigoto7170,7190,7200
7170 ifer=0thenprint"{REVERSE ON}M{CM T}{CM T}":goto7250
7180 print"{REVERSE ON}M  ":goto7250
7190 print"{REVERSE ON} M ":goto7250
7200 print"{REVERSE ON}  M":goto7250
7210 onigoto7220,7230,7240
7220 print"{REVERSE ON}{CM ASTERISK}":goto7250
7230 print"{REVERSE ON} {CM ASTERISK}":goto7250
7240 print"{REVERSE ON}  {CM ASTERISK}"
7250 nexti
7260 return
7270 rem display depth 4
7280 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
7290 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}";:g$=g$+"{RIGHT}{RIGHT}{RIGHT}"
7300 fori=ktol:printg$;:ifc=0goto7340
7310 onigoto7320,7330
7320 print"M{RIGHT}";:goto7380
7330 print"{RIGHT}M";:goto7380
7340 onigoto7350,7360
7350 print"{RIGHT}{RIGHT}";:goto7380
7360 ifel=kthenprint"{CM @}{CM @}";:goto7380
7370 print"{RIGHT}{CM @}";
7380 ife=0ori=kthenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto7400
7390 print"{CM @}{CM @}{CM @}{CM @}";
7400 ifd=0goto7440
7410 onigoto7420,7430
7420 print"{RIGHT}N":goto7480
7430 print"N":goto7480
7440 onigoto7450,7460
7450 print:goto7480
7460 ifer=kthenprint"{CM @}{CM @}":goto7480
7470 print"{CM @}"
7480 next
7490 fori=kto5:printg$;:ifc=kthenprint"{RIGHT}{CM M}";:goto7540
7500 ifel=kthenprint"{REVERSE ON}{CM +}{CM +}{REVERSE OFF}";:goto7540
7510 ifi=kthenprint"{CM @}{REVERSE ON}{CM +}{REVERSE OFF}";:goto7540
7520 ifi>4thenprint"{REVERSE ON}{CM T}{CM +}{REVERSE OFF}";:goto7540
7530 print" {REVERSE ON}{CM +}{REVERSE OFF}";
7540 ife=0thenprint"{RIGHT}{RIGHT}{RIGHT}{RIGHT}";:goto7560
7550 print"{REVERSE ON}{CM +}{CM +}{CM +}{CM +}{REVERSE OFF}";
7560 ifd=kthenprint"{CM G}":goto7610
7570 ifer=kthenprint"{REVERSE ON}{CM +}{CM +}":goto7610
7580 ifi=kthenprint"{REVERSE ON}{CM +}{REVERSE OFF}{CM @}":goto7610
7590 ifi>4thenprint"{REVERSE ON}{CM +} ":goto7610
7600 print"{REVERSE ON}{CM +}"
7610 next
7620 fori=ktol:printg$;:ifc=kgoto7670
7630 onigoto7640,7660
7640 ifel=0thenprint"{REVERSE ON}{CM T}N";:goto7700
7650 print"{REVERSE ON} N";:goto7700
7660 print"{REVERSE ON}N ";:goto7710
7670 onigoto7680,7690
7680 print"{RIGHT}{REVERSE ON}{SH POUND}";:goto7700
7690 print"{REVERSE ON}{SH POUND} ";:goto7710
7700 ife=0thenprint"{REVERSE ON}{CM T}{CM T}{CM T}{CM T}";:goto7720
7710 print"{REVERSE ON}    ";
7720 ifd=kgoto7770
7730 onigoto7740,7760
7740 ifer=0thenprint"{REVERSE ON}M{CM T}":goto7800
7750 print"{REVERSE ON}M ":goto7800
7760 print"{REVERSE ON} M":goto7800
7770 onigoto7780,7790
7780 print"{REVERSE ON}{CM ASTERISK}":goto7800
7790 print"{REVERSE ON} {CM ASTERISK}":goto7800
7800 nexti
7810 return
7820 rem display depth 5
7830 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
7840 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}";:g$=g$+"{RIGHT}{RIGHT}"
7850 printg$;:ifc=0goto7870
7860 print"M";:goto7880
7870 print"{CM @}";
7880 ife=0thenprint"{RIGHT}{RIGHT}";:goto7900
7890 print"{CM @}{CM @}";
7900 ifd=0goto7920
7910 print"N":goto7930
7920 print"{CM @}"
7930 fori=kton:printg$;:ifc=kgoto7950
7940 print"{CM +}";:goto7960
7950 print"{CM M}";
7960 ife=0thenprint"{RIGHT}{RIGHT}";:goto7980
7970 print"{CM +}{CM +}";
7980 ifd=0thenprint"{CM +}":goto8000
7990 print"{CM G}"
8000 next
8010 printg$;:ifc=kgoto8030
8020 print"{REVERSE ON}N";:goto8040
8030 print"{REVERSE ON}{SH POUND}";
8040 ife=kthenprint"{REVERSE ON}  ";:goto8060
8050 print"{REVERSE ON}{CM T}{CM T}";
8060 ifd=kgoto8080
8070 print"{REVERSE ON}M":goto8090
8080 print"{REVERSE ON}{CM ASTERISK}"
8090 return
8100 gosub8220
8110 print"{UP}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*  way out  *
8120 gosub4620:poke59468,12:ifm1thenprint"{DOWN}{DOWN}{DOWN}{DOWN}":goto8170
8130 print"{CLEAR}here is the maze":gosub4620
8140 gosub3650
8150 x=ti+(h+v)*60
8160 ifx>tigoto8160
8170 print"another game (y/n)? ";
8180 zc$="yn":gosub50:g$=z$
8200 print"{CLEAR}":ifg$="y"goto2140
8210 goto9500
8220 rem print text border
8230 rem"{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}
8240 print"{CLEAR}"
8250 print
8260 print"   {CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}{CM U}"
8270 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*************
8280 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*           *
8290 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*           *
8300 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*           *
8310 print"{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}{RIGHT}*************{UP}{UP}
8320 return
9000 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}";
9030 print"      {REVERSE ON}f{REVERSE OFF}orward {REVERSE ON}l{REVERSE OFF}eft {REVERSE ON}r{REVERSE OFF}ight {REVERSE ON}h{REVERSE OFF}elp {REVERSE ON}q{REVERSE OFF}uit";
9040 return
9100 print"{HOME}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}                * = quit":return
9500 poke145,sk:print"{CLEAR}";:poke59468,12:end
