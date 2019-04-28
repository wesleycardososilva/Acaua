%ao 	0.100 	0.150 	(o)-1 	Coeficiente linear curva cl-alfa perfil
%M 		2.303 	2.997 	Kg 		Massa total(massa vazio +massa carga paga) na decolagem
%alphao -2.224 	-0.050 	o 		Alfa para sustentação nula
%clmax 	1.000 	1.300 	adm 	Coeficiente de sustentação m


%getFitness2(0.1, 2.303, -2.224, 1.000)
%getFitness2(0.125, 2.605, -1.435, 1.105)
%getFitness2(0.150, 2.997, -0.050, 1.300)

function [fitness] = getFitness(ao, alphao, clmax, M)%baseado nas variáveis geradas

%GETDISTANCE returns the traveled distance by the plane. 
    
    %S = 0.745;
    %B = 2.3;
    %b = -0.8;
    %a = 29.5;
    %G = 9.78;
    %o = 1.225;
    %CDmin = 0.027;
    %mi_s = 0.03;
    %M0 = 2.448;
    %d = 69.1;
    %e = 0.735;
    %h = 0.196;
    
    %phi = getPhi(h, B);
    %AR = getAR(B, S);
    %M = getM(M0, Cp);
    %W = getW(M, G);
    %Vestol = getVestol(W, ro, S, CLmax);
    %V = getV(Vestol);
    %Cdi = getCdi(CDmin, phi, Cl, e, AR);
    %A = getA(ro, S, mi_s, Cl, Cdi);
    %C = getC(a, mi_s, W);
    
    %delta = sqrt(4 * A * C - b.^2);
    %num = 2 * b * (atan(b / delta) - atan((b + 2 * A * V) / delta));
    %dist = M / (2 * A) * (real(num / delta) - log(C) + log(C + V * (b + A * V)));
	
	%Constantes Valores que constam no pdf
	C1 = 10.800; 	%Coeficiente linear da curva T(v)
	A1= -0.026; 		% Coeficiente angular da curva T(v)
	G = 9.780;		%Gravidade
	d = 59.0;		%Distanciapercorrida na decolagem
	gamma = 1.3; 	%Fator de segurançaa na decolagem
	rad = 57.30; 	%Grau
	
	S = 0.34;		%Área da asa
	b = 1.3; 		%Envergadura da Asa
	ro = 1.225;		%Densidade do ar
	
	lambda = 0.524; %Angulo de enflechamento
	ef = 0.980;		%Razão de eficiêcia da asa
	K = 0.087;		%Fator K
	h = 0.195; 		%Altura da asa
	mu =0.03; 		%Coeficiente de atrito estático
	CDo = 0.033;	%Coeficiente de arrasto parasita
	k = 0.087;		% Fator K
	
	%Constantes calculadas
	AR = getAR(b, S);						%Razão de aspecto
	W = getW(M, G);							%Peso
	a = geta(rad, ao, lambda, ef, AR);		%Coeficiente linear curva CL-alfa
	CLmax = getCLmax(clmax, a, ao);			%Coeficiente de sustentação máximo
	CLmd = getCLmd(a, alphao);				%Coeficiente de sustentação de mínimo arrasto
	phi = getPhi(h, b);						%Parâmetro de proximidade da asa com o solo
	CLto = getCLto(CLmd, mu, phi, K);		%Coeficiente de sustentação na decolagem
	Vestol = getVestol(W, ro, S, CLmax);	%Velocidade mínima de decolagem calculada
	%CDmin = getCDmin(CDo,CLmd,phi,k);
	%d = getDist(M, A1, ro, mu, CLto, CDmin, phi, k, CLmd, S, gamma, G, C1, CLmax)
	
	
	%Variáveis geradas
	%ao
	%alphao
	%clmax - vai calcular o CLmaz
	%M - massa total


	
q0=0.37868414897573366;
q1=AR;
q2=q0^5.*q1^8;
q3=6.0;
q4=pi+1.0;
q5=AR+q4;
q6=8.0+-7.698317371377549E-6;
q7=q5+q6;
q8=q3^9+q7;
q9=W.^5.0;
q10=10.0.*q9;
q11=7.0.*9.0;
q12=-0.005043618983894127+q11;
q13=5.0;
q14=q12.*q13^9;
q15=5.0;
q16=q14-q15^9;
q17=7.0-q16;
q18=q10+q17;
q19=q8+q18;
q20=AR;
q21=d+pi;
q22=10.0.*10.0;
q23=pi+q22;
q24=q21.*q23;
q25=W.^5.0;
q26=q24+q25;
q27=5.0+pi;
q28=4.0+-1.991075058403559E-22;
if(q28==0)
    q29=1;
else
	q29=10.0./q28;
end
q30=q27+q29;
q31=W.^q30;
q32=7.0;
q33=0.050525893975211233.*pi;
q34=pi.^gamma;
q35=q33.*q34;
q36=W.*q35;
q37=0.16121381059170636+q36;
q38=W.*q37;
q39=d+q38;
q40=Vestol-3.0;
if(d==0)
    q41=1;
else
	q41=0.07215306759316831./d;
end
q42=9.0+q41;
q43=q42+10.0;
q44=pi+8.0;
q45=W+q44;
q46=W+q45;
q47=W+q46;
if(CLmax==0)
    q48=1;
else
	q48=2.0./CLmax;
end
q49=q48+W;
if(q49==0)
    q50=1;
else
	q50=q47./q49;
end
q51=q50+W;
q52=q51.*4.0;
q53=q52.*10.0;
q54=q43.*q53;
q55=5.0.^Vestol;
q56=-0.001985643557259871+q55;
q57=q54+q56;
q58=q40+q57;
q59=q39+q58;
q60=0.43925120450922883+q59;
q61=2.0+q60;
q62=5.0;
q63=q62^8.*d;
if(q63==0)
    q64=1;
else
	q64=q61./q63;
end
q65=q64+W;
q66=q65+6.0;
q67=q66+5.742803557345638E-16;
q68=q32^6.*q67;
q69=d-q68;
q70=6.0;
q71=q69-q70^8;
q72=9.0.^2.0;
q73=8.0+q72;
q74=5.0;
q75=q73.*q74^9;
q76=q75+7.0;
q77=q71-q76;
q78=6.936378014207371E-5-q77;
if(W==0)
    q79=1;
else
	q79=5.0./W;
end
q80=q78-q79;
q81=q80./0.9361046727713672;
q82=q81-pi;
q83=AR;
q84=q83^8.*rad;
if(q84==0)
    q85=1;
else
	q85=C1./q84;
end
q86=AR.*rad;
if(q86==0)
    q87=1;
else
	q87=q85./q86;
end
q88=q87-10.0;
q89=5.0+C1;
q90=q89.^W;
q91=q90;
q92=5.0.^Vestol;
q93=q92./1.0;
q94=Vestol./pi;
q95=q93-q94;
q96=Vestol+q95;
q97=q96;
q98=5.0.*q97^1;
q99=q91^9-q98;
if(q99==Inf)
	q99=1;
end
y0=2.0./-5.134563998045419E-4;
y1=6.0.^Vestol;
y2=y0-y1;
y3=AR;
y4=y3^7-W;
if(y4==0)
    y5=1;
else
	y5=y2./y4;
end
if(y5==0)
    y6=1;
else
	y6=q99./y5;
end
y7=7.0;
y8=y6.*y7^11;
y9=y8+9.0;
y10=q88-y9;
y11=10.0.^Vestol;
y12=y10+y11;
y13=5.0;
y14=y13^8.*d;
if(y14==0)
    y15=1;
else
	y15=y12./y14;
end
y16=CLto;
y17=y16^9.*d;
if(y17==0)
    y18=1;
else
	y18=d./y17;
end
y19=y15+y18;
y20=7.245307304147787E-27+10.0;
if(y20==0)
    y21=1;
else
	y21=y19./y20;
end
if(y21==Inf)
	y21=1;
end
y22=6.0--1.9910750584035587E-17;
y23=5.0.^8.0;
y24=7.0.*rad;
if(y24==0)
    y25=1;
else
	y25=y23./y24;
end
y26=Vestol+7.0;
y27=y25+y26;
y28=y22+y27;
if(y28==0)
    y29=1;
else
	y29=y21./y28;
end
y30=W.*6.0;
y31=y29+y30;
y32=5.0;
y33=y31.*y32^9;
y34=5.0-5.0;
y35=y33+y34;
y36=q82-y35;
y37=5.0.^Vestol;
y38=y36-y37;
y39=AR;
y40=y39^8.*rad;
if(y40==0)
    y41=1;
else
	y41=y38./y40;
end
if(y41==Inf)
	y41=1
end
y42=y41-7.0;
y43=y42;
y44=q31+y43^8;
if(y44==Inf)
	y44=1;
end
y45=y44.*1.9910750584035584E-9;
if(y45==Inf)
	y45=1;
end
y46=5.0.^9.0;
y47=-1.9910750584035585E-11.^y46;
y48=9.0.*6.0;
y49=W.*y48;
y50=9.0;
y51=y49.*y50^9;
y52=7.801366840135759E-9-10.0;
y53=1.0.*y52;
y54=y53;
y55=y51-y54^9;
y56=8.0-y55;
y57=pi+y56;
y58=y47+y57;
y59=y58+-6.790362861114142E-12;
y60=Vestol+W;
y61=y59.*y60;
y62=1.9910750584035584E-9+y61;
y63=5.0;
if(y63==0)
    y64=1;
else
	y64=y62./y63^10;
end
y65=4.0.*y64;
y66=y45-y65;
if(y66==Inf)
	y66=1;
end
y67=q26+y66;
if(y67==Inf)
	y67=1;
end
y68=W+y67;
if(y68==Inf)
	y68=1;
end
y69=3.0.*7.0;
y70=10.0+y69;
y71=8.0;
y72=y71^8.*d;
y73=y72-a;
y74=5.0;
y75=y74^9.*0.7826917258867383;
y76=6.0+y75;
y77=y76+W;
y78=Vestol./-1.9910750584035584E-10;
y79=y77+y78;
y80=y79+4.0;
y81=5.0.*y80;
y82=Vestol+W;
y83=y82+9.0;
y84=y83+d;
y85=5.0;
y86=y84.*y85^10;
y87=y86./1.0;
y88=AR-y87;
y89=1.0.*y88;
y90=5.0.^Vestol;
y91=y89-y90;
y92=AR;
y93=y92^8.*rad;
if(y93==0)
    y94=1;
else
	y94=y91./y93;
end
y95=y94-7.0;
y96=y95;
y97=y81+y96^8;
y98=y97.*W;
y99=W.*y98;
j0=y99+pi;
j1=j0+10.0;
j2=1.0.*j1;
j3=2.0+j2;
j4=9.0+j3;
j5=5.0;
j6=j5^7.*d;
if(j6==0)
    j7=1;
else
	j7=j4./j6;
end
j8=j7-9.0;
j9=j8-W;
j10=5.0.^Vestol;
j11=1.0+j10;
j12=3.0.^3.0;
j13=5.0+W;
j14=3.0;
j15=rad+j14^9;
j16=W.^8.0;
j17=d.^Vestol;
j18=j16+j17;
j19=10.0+j18;
j20=9.0.*j19;
j21=AR;
j22=j21^8.*rad;
if(j22==0)
    j23=1;
else
	j23=j20./j22;
end
j24=j23--0.024026208882933733;
j25=j15.*j24;
j26=6.365629622122103E-20.*j25;
j27=5.0+j26;
j28=5.0.*G;
if(j28==0)
    j29=1;
else
	j29=Vestol./j28;
end
j30=j27-j29;
j31=j30+0.996449947767231;
if(j31==0)
    j32=1;
else
	j32=j13./j31;
end
j33=9.0.^j32;
j34=6.0-3.0;
j35=5.0.^Vestol;
j36=5.0.*j35;
j37=AR.^Vestol;
j38=5.0.^Vestol;
j39=j37+j38;
j40=2.0.*j39;
j41=j36+j40;
j42=1.0.*0.7628220713883095;
j43=j41+j42;
j44=W+5.0;
j45=0.0014165125553585525.*0.23341562201389776;
if(j45==0)
    j46=1;
else
	j46=d./j45;
end
j47=W.^3.0;
j48=5.0.^Vestol;
j49=j47+j48;
j50=4.0.^2.0;
j51=0.22907228452529416-d;
j52=j50+j51;
j53=j49-j52;
j54=j46+j53;
j55=1.9910750584035586E-13+j54;
j56=j44-j55;
j57=5.0;
j58=j57^8.*d;
if(j58==0)
    j59=1;
else
	j59=j56./j58;
end
j60=j59-1.4556096529172386E-25;
j61=j60;
j62=6.4504650089662255E-12+j61^7;
j63=j62.*1.9910750584035584E-9;
j64=3.0.*0.025565852688161517;
j65=j63.*j64;
if(j65==0)
    j66=1;
else
	j66=10.0./j65;
end
j67=j43+j66;
j68=j67+9.0;
j69=pi+j68;
j70=j34+j69;
j71=8.0+j70;
j72=AR;
j73=j72^8.*rad;
if(j73==0)
    j74=1;
else
	j74=j71./j73;
end
j75=j74+W;
j76=d+j75;
j77=j76+10.0;
j78=j77+10.0;
j79=j33.*j78;
j80=6.0+j79;
j81=j12.*j80;
j82=2.0+-3.1509080730551724E-22;
j83=0.031833965259038546.^pi;
j84=10.0.^j83;
j85=Vestol./0.44750021369798676;
j86=4.0+-1.991075058403559E-22;
j87=j85.^j86;
j88=6.0;
j89=j87-j88^9;
j90=j84.*j89;
j91=5.0.^Vestol;
j92=j90+j91;
j93=-1.691538909489053E-10+j92;
j94=j82+j93;
j95=j81+j94;
j96=j11+j95;
j97=AR;
j98=j97^8.*d;
if(j98==0)
    j99=1;
else
	j99=j96./j98;
end
z0=j99+W;
z1=d+10.0;
z2=3.0861815382895624E-5--6.634444987632672E-9;
z3=7.0;
z4=6.0.^Vestol;
z5=z3^10-z4;
z6=AR;
z7=z6^8.*5.0;
if(z7==0)
    z8=1;
else
	z8=z5./z7;
end
z9=alphao;
if(z9==0)
    z10=1;
else
	z10=7.0./z9^8;
end
if(z10==Inf)
	z10=1;
end
z11=5.0.^z10;
if(z11==Inf)
	z11=1;
end
z12=z11-4.0;
if(z12==Inf)
	z12=1;
end
if(z12==0)
    z13=1;
else
	z13=z8./z12;
end
z14=W+z13;
z15=W.^Vestol;
z16=1.9910750584035587E-16.*z15;
z17=pi./10.0;
z18=5.0+z17;
z19=5.0.^z18;
z20=z16+z19;
z21=AR.^Vestol;
z22=5.0.^10.0;
if(z22==0)
    z23=1;
else
	z23=z21./z22;
end
z24=z23+W;
z25=z24.^1.0;
z26=z25-rad;
z27=z20.^z26;
if(z27==Inf)
	z27=1;
end
z28=10.0.*z27;
if(z28==Inf)
	z28=1;
end
z29=z28+3.0;
z30=1.0-z29;
z31=z30.*3.0;
z32=9.475310111670767E-19+z31;
z33=z14.*z32;
z34=AR+z33;
z35=z2-z34;
z36=1.942684525202057E-5-z35;
z37=CLto;
z38=z37^9.*9.0;
if(z38==0)
    z39=1;
else
	z39=z36./z38;
end
z40=6.0.^Vestol;
z41=z39-z40;
z42=AR;
z43=z42^9.^pi;
if(z43==0)
    z44=1;
else
	z44=z41./z43;
end
if(z44==0)
    z45=1;
else
	z45=z1./z44;
end
z46=7.0;
z47=z45.*z46^10;
z48=z47.*1.0;
z49=z0.*z48;
z50=z49--4.771370569295084E-6;
z51=10.0.^AR;
z52=W+d;
z53=z51.*z52;
if(z53==0)
    z54=1;
else
	z54=z50./z53;
end
if(d==0)
    z55=1;
else
	z55=z54./d;
end
z56=j9+z55;
z57=y73+z56;
z58=5.0;
z59=z58^8.*d;
if(z59==0)
    z60=1;
else
	z60=z57./z59;
end
z61=alphao;
z62=d+z61^9;
z63=7.0.^3.0;
z64=z63-W;
z65=z62.*z64;
z66=z60+z65;
z67=AR.^Vestol;
z68=rad-z67;
z69=AR;
z70=z69^7.*rad;
if(z70==0)
    z71=1;
else
	z71=z68./z70;
end
z72=z71+rad;
z73=z72+10.0;
z74=5.0.*z73;
z75=9.0.*W;
z76=W.^5.0;
z77=10.0.*z76;
z78=9.0.^6.0;
z79=8.0.*8.0;
z80=7.0+z79;
z81=5.0;
z82=z80.*z81^9;
z83=z82+W;
z84=z78-z83;
z85=z77+z84;
z86=7.0-z85;
z87=z75.*z86;
z88=3.0.*z87;
z89=6.0.*z88;
z90=2.0;
if(z90==0)
    z91=1;
else
	z91=Vestol./z90^7;
end
z92=0.21517561038607058-W;
z93=z92./pi;
z94=z93-W;
z95=W+Vestol;
z96=5.0.*z95;
z97=z96.*10.0;
z98=0.6140768587350608.*z97;
z99=z94+z98;
u0=pi;
u1=5.0.^Vestol;
u2=5.0-u1;
u3=Vestol+W;
if(u3==0)
    u4=1;
else
	u4=u2./u3;
end
u5=u4-Vestol;
u6=u5;
u7=5.0+u6^7;
u8=u7.*1.9910750584035584E-9;
u9=9.0.*u8;
if(u9==0)
    u10=1;
else
	u10=6.0./u9;
end
u11=u0^7+u10;
if(u11==0)
    u12=1;
else
	u12=z99./u11;
end
u13=0.7248078447781285.*u12;
u14=ao.^3.6285384227440544E-4;
u15=u13+u14;
u16=9.0+u15;
u17=Vestol.^pi;
u18=9.0.*10.0;
u19=u17-u18;
u20=5.0.*u19;
if(rad==0)
    u21=1;
else
	u21=u20./rad;
end
u22=6.0+-6.790362861114141E-11;
u23=u21-u22;
u24=7.0-u23;
u25=0.024572646010304844.^u24;
u26=alphao.*u25;
u27=u16.^u26;
u28=9.0+W;
u29=rad+u28;
u30=6.0;
u31=u29.*u30^11;
u32=u27./u31;
if(u32==0)
	u33=1;
else
	u33=z91./u32 ;
end
u34=z89+u33;
u35=6.919665232152939E-7+u34;
u36=AR;
u37=u36^9.*rad;
u38=u35./u37;
u39=u38+2.0;
u40=0.34853353352055005.^W;
u41=4.0.^u40;
u42=u41+d;
u43=8.0.*10.0;
u44=5.5631483737001036E-11+u43;
u45=8.0-u44;
u46=2.0+alphao;
u47=u46-Vestol;
u48=u47.^1.0;
u49=u48--7.533622324461258E-4;
f0=u45-u49;

if(f0==0)
	f1=1
else
	f1=u42./f0;
end
f2=f1;
f3=2.0.^3.0;
f4=1.0+5.0;
f5=f3-f4;
f6=f5-W;

if (f6==0)
	f7=1;
else
	f7=9.0./f6;
end
f8=f2^10-f7;
f9=f8.*6.0;
fitness=((((q2+(q19+(q20^8+(y68+(((y70.*(z66+(z74.*(u39+((10.0+((10.0.*(5.0.*((f9+9.0)+rad)))./((4.0.*0.07033032374258939)+CLmax)))-(W+9.0))))))./1.0)+(5.0.^Vestol))))))./((AR)^8.*d))+W)+W);

	
	
	
	
	
	
end

function [r] = getM(M0, Cp)
    r = M0 + Cp;
end

function [r] = getAR(b, S)
    if(S==0)
        r=1;
    else
        r = b.^2 / S;
    end
end

function [r] = getVestol(W, ro, S, CLmax)
    num = 2 * W;
    den = ro * S * CLmax;
    
    if(den==0)
        t1=1;
	else 
		t1 = sqrt(num / den);
    end
    %if(t1<10.811)
        %t1=10.811;
    %else
        %if(t1>14.083)
            %t1=14.083;
        %end
    %end    
    r=t1;
end

function [r] = getW(M, G)
   t1 = M * G;
    %if(t1<22.523)
        %t1=22.523;
    %else
        %if(t1>29.311)
           %t1=29311;
        %end
    %end
    r=t1;
end

function [r]  = geta(rad, ao, lambda, ef, AR)
	
		
	t1 = rad*ao*cos(lambda);
	t2 = pi*ef*AR;
	if(t2==0)
		t4=1;
    else
		t4=(sqrt(1 + (t1/t2.^2)) + (t1/t2));
	end
	t5=t4*rad;
	if(t5==0)
		t3=1;
	else
		t3 = t1/t5;
	end
	
    
    
    %if(t3<0.065)
        %t3=0.065;
    %else
        %if(t3>0.086)
            %t3=0.086;
        %end
    %end
    r=t3;
   
    
	
end

function [r]  = getCLmax(clmax, a, ao)
	
    if(ao==0)
        t1=1;
	else
		t1 = clmax*(a/(0.85*ao));
	end
    %if(t1<0.689)
        %t1=0.689;
    %else
        %if(t1<0.985)
            %t1=0.985;
        %end
    %end
    r=t1;
	
end



function [r]  = getCLmd(a, alphao)
	t1 = -0.5 * a * alphao;
    if(t1<0.002)
        t1=0.002;
    else
        if(t1>0.094)
            t1=0.094;
        end
    end
    r=t1;
end

function [r] = getPhi(h, b)
    
	if(b==0)
        num=1;
    else
		num = ((16 * h) / b).^2;
	end
	if(num==0)
		den=1;
	else
		den = 1 + num;
	end	
    r = num / den;
    
end

function [r]  = getCLto(CLmd, mu, phi, K)
	t2=(2 * phi * K);
	if(t2==0)
		t1=1;
	else
		t1 = CLmd+(mu/t2);
	end
	
    if(t1<0.204)
        t1=0.204;
    else
        if(t1>0.296)
            t1=0.296;
        end
    end
    r=t1;
    
end


function [r] = getDist(M, A1, ro, mu, CLto, CDmin, phi, k, CLmd, S, gamma, G, C1, CLmax)
    
	f1 = round(M/(2 * (A1 + 0.5 * ro *S * (mu * CLto - CDmin - phi *k * (CLto - CLmd)^2))), 3);
	t1 = A1 + 0.5 * ro * S ;
	t2 = mu *CLto - CDmin - phi * k;
	t3 = CLto -CLmd;
	t4 = 2 * M *G;
	t5 = C1 - mu * M * G;
	t6 = ro * S * CLmax;
	f2 = round(((t1* (t2 * (t3)^2)) * (gamma^2) * t4)/(t5 *	t6), 3);

	r = round(f1 * log(f2 + 1), 3);
end

function [r] = getCDmin(CDo,CLmd,phi,k)
	r = CDo-phi*k*(CLmd)^2;
end
%N foram usadas
%---------------------------------------------------------------------------



function [r] = getV(Vestol)
    r = 1.2 * Vestol;
end

function [r] = getCdi(CDmin, phi, Cl, e, AR)
    Clmd = 0.324;  
    num = (Cl - Clmd).^2;
    den = e * AR * pi;
    r = CDmin + phi * (num / den);
end

function [r] = getA(ro, S, mi_s, Cl, Cdi)
    r = 0.5 * ro * S * (mi_s * Cl - Cdi);
end

function [r] = getC(a, mi_s, W)
    r = a - mi_s * W;
end
