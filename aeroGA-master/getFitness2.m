%ao 	0.100 	0.150 	(o)-1 	Coeficiente linear curva cl-alfa perfil
%M 		2.303 	2.997 	Kg 		Massa total(massa vazio +massa carga paga) na decolagem
%alphao -2.224 	-0.050 	o 		Alfa para sustenta��o nula
%clmax 	1.000 	1.300 	adm 	Coeficiente de sustenta��o m


%getFitness2(0.1, 2.303, -2.224, 1.000)
%getFitness2(0.125, 2.605, -1.435, 1.105)
%getFitness2(0.150, 2.997, -0.050, 1.300)

function [fitness] = getFitness2(ao, M, alphao, clmax)%baseado nas vari�veis geradas
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
	G = 9.780;		%Gravidade
	d = 59.0;		%Distanciapercorrida na decolagem
	gamma = 1.3; 	%Fator de seguran�aa na decolagem
	rad = 57.30; 	%Grau
	
	S = 0.34;		%�rea da asa
	b = 1.3; 		%Envergadura da Asa
	ro = 1.225;		%Densidade do ar
	
	lambda = 0.524; %Angulo de enflechamento
	ef = 0.980;		%Raz�o de efici�cia da asa
	K = 0.087;		%Fator K
	h = 0.195; 		%Altura da asa
	mu =0.03; 		%Coeficiente de atrito est�tico
	
	%Constantes calculadas
	AR = getAR(b, S);						%Raz�o de aspecto
	W = getW(M, G);							%Peso
	a = geta(rad, ao, lambda, ef, AR);		%Coeficiente linear curva CL-alfa
	CLmax = getCLmax(clmax, a, ao);			%Coeficiente de sustenta��o m�ximo
	CLmd = getCLmd(a, alphao);				%Coeficiente de sustenta��o de m�nimo arrasto
	phi = getPhi(h, b);						%Par�metro de proximidade da asa com o solo
	CLto = getCLto(CLmd, mu, phi, K);		%Coeficiente de sustenta��o na decolagem
	Vestol = getVestol(W, ro, S, CLmax);	%Velocidade m�nima de decolagem calculada
	
	%Vari�veis geradas
	%ao
	%alphao
	%clmax - vai calcular o CLmaz
	%M - massa total
	
	aux01 = ((d-((7.0)^6.*(((((2.0+(0.43925120450922883+((d+(W.*(0.16121381059170636+(W.*((0.050525893975211233.*pi).*(pi.^gamma))))))+((Vestol-3.0)+((((9.0+(0.07215306759316831./d))+10.0).*(((((W+(W+(W+(pi+8.0))))./((2.0./CLmax)+W))+W).*4.0).*10.0))+(-0.001985643557259871+(5.0.^Vestol)))))))./((5.0)^8.*d))+W)+6.0)+5.742803557345638E-16)))-(6.0)^8)-(((8.0+(9.0.^2.0)).*(5.0)^9)+7.0);
	
	aux02 = (((C1./((AR)^8.*rad))./(AR.*rad))-10.0)-(((((((5.0+C1).^W))^9-(5.0.*((Vestol+(((5.0.^Vestol)./1.0)-(Vestol./pi))))^1))./(((2.0./-5.134563998045419E-4)-(6.0.^Vestol))./((AR)^7-W))).*(7.0)^11)+9.0);
	
	aux03 = (((9.0+(2.0+(1.0.*(((W.*(((5.0.*((((6.0+((5.0)^9.*0.7826917258867383))+W)+(Vestol./-1.9910750584035584E-10))+4.0))+(((((1.0.*(AR-(((((Vestol+W)+9.0)+d).*(5.0)^10)./1.0)))-(5.0.^Vestol))./((AR)^8.*rad))-7.0))^8).*W))+pi)+10.0))))./((5.0)^7.*d))-9.0)-W;
	
	aux04 = 9.0.^((5.0+W)./(((5.0+(6.365629622122103E-20.*((rad+(3.0)^9).*(((9.0.*(10.0+((W.^8.0)+(d.^Vestol))))./((AR)^8.*rad))--0.024026208882933733))))-(Vestol./(5.0.*G)))+0.996449947767231));
	
	aux05 = 6.0+(aux04.*(((d+(((8.0+((6.0-3.0)+(pi+(((((5.0.*(5.0.^Vestol))+(2.0.*((AR.^Vestol)+(5.0.^Vestol))))+(1.0.*0.7628220713883095))+(10.0./(((6.4504650089662255E-12+(((((W+5.0)-(1.9910750584035586E-13+((d./(0.0014165125553585525.*0.23341562201389776))+(((W.^3.0)+(5.0.^Vestol))-((4.0.^2.0)+(0.22907228452529416-d))))))./((5.0)^8.*d))-1.4556096529172386E-25))^7).*1.9910750584035584E-9).*(3.0.*0.025565852688161517))))+9.0))))./((AR)^8.*rad))+W))+10.0)+10.0));
	
	aux06 = (((1.0+(5.0.^Vestol))+(((3.0.^3.0).*aux05)+((2.0+-3.1509080730551724E-22)+(-1.691538909489053E-10+(((10.0.^(0.031833965259038546.^pi)).*(((Vestol./0.44750021369798676).^(4.0+-1.991075058403559E-22))-(6.0)^9))+(5.0.^Vestol))))))./((AR)^8.*d))+W;
	
	aux07 = AR+((W+((((7.0)^10-(6.0.^Vestol))./((AR)^8.*5.0))./((5.0.^(7.0./(alphao)^8))-4.0))).*(9.475310111670767E-19+((1.0-((10.0.*(((1.9910750584035587E-16.*(W.^Vestol))+(5.0.^(5.0+(pi./10.0)))).^(((((AR.^Vestol)./(5.0.^10.0))+W).^1.0)-rad)))+3.0)).*3.0)));
	
	aux08 = (pi)^7+(6.0./(9.0.*((5.0+((((5.0-(5.0.^Vestol))./(Vestol+W))-Vestol))^7).*1.9910750584035584E-9)));
	
	fitness = ((((((0.37868414897573366)^5.*(AR)^8)+((((6.0)^9+((AR+(pi+1.0))+(8.0+-7.698317371377549E-6)))+((10.0.*(W.^5.0))+(7.0-(((-0.005043618983894127+(7.0.*9.0)).*(5.0)^9)-(5.0)^9))))+((AR)^8+((W+((((d+pi).*(pi+(10.0.*10.0)))+(W.^5.0))+((((W.^((5.0+pi)+(10.0./(4.0+-1.991075058403559E-22))))+(((((((((6.936378014207371E-5-aux01)-(5.0./W))./0.9361046727713672)-pi)-((((((((aux02+(10.0.^Vestol))./((5.0)^8.*d))+(d./((CLto)^9.*d)))./(7.245307304147787E-27+10.0))./((6.0--1.9910750584035587E-17)+(((5.0.^8.0)./(7.0.*rad))+(Vestol+7.0))))+(W.*6.0)).*(5.0)^9)+(5.0-5.0)))-(5.0.^Vestol))./((AR)^8.*rad))-7.0))^8).*1.9910750584035584E-9)-(4.0.*((1.9910750584035584E-9+((((-1.9910750584035585E-11.^(5.0.^9.0))+(pi+(8.0-(((W.*(9.0.*6.0)).*(9.0)^9)-((1.0.*(7.801366840135759E-9-10.0)))^9))))+-6.790362861114142E-12).*(Vestol+W)))./(5.0)^10)))))+((((10.0+(3.0.*7.0)).*(((((((8.0)^8.*d)-a)+(aux03+((((aux06.*((((d+10.0)./((((1.942684525202057E-5-((3.0861815382895624E-5--6.634444987632672E-9)-aux07))./((CLto)^9.*9.0))-(6.0.^Vestol))./((AR)^9.^pi))).*(7.0)^10).*1.0))--4.771370569295084E-6)./((10.0.^AR).*(W+d)))./d)))./((5.0)^8.*d))+((d+(alphao)^9).*((7.0.^3.0)-W)))+((5.0.*((((rad-(AR.^Vestol))./((AR)^7.*rad))+rad)+10.0)).*((((6.919665232152939E-7+((6.0.*(3.0.*((9.0.*W).*(7.0-((10.0.*(W.^5.0))+((9.0.^6.0)-(((7.0+(8.0.*8.0)).*(5.0)^9)+W)))))))+((Vestol./(2.0)^7)./(((9.0+((0.7248078447781285.*(((((0.21517561038607058-W)./pi)-W)+(0.6140768587350608.*((5.0.*(W+Vestol)).*10.0)))./aux08))+(ao.^3.6285384227440544E-4))).^(alphao.*(0.024572646010304844.^(7.0-(((5.0.*((Vestol.^pi)-(9.0.*10.0)))./rad)-(6.0+-6.790362861114141E-11))))))./((rad+(9.0+W)).*(6.0)^11)))))./((AR)^9.*rad))+2.0)+((10.0+((10.0.*(5.0.*((((((((4.0.^(0.34853353352055005.^W))+d)./((8.0-(5.5631483737001036E-11+(8.0.*10.0)))-((((2.0+alphao)-Vestol).^1.0)--7.533622324461258E-4))))^10-(9.0./(((2.0.^3.0)-(1.0+5.0))-W))).*6.0)+9.0)+rad)))./((4.0.*0.07033032374258939)+CLmax)))-(W+9.0))))))./1.0)+(5.0.^Vestol))))))./((AR)^8.*d))+W)+W);
	
	
end

function [r] = getM(M0, Cp)
    r = M0 + Cp;
end

function [r] = getAR(b, S)
    r = b.^2 / S;
end

function [r] = getVestol(W, ro, S, CLmax)
    num = 2 * W;
    den = ro * S * CLmax;
    r = sqrt(num / den);
end

function [r] = getW(M, G)
    r = M * G;
end

function [r]  = geta(rad, ao, lambda, ef, AR)
	t1 = rad*ao*cos(lambda);
	t2 = pi*ef*AR;
	r = t1/(sqrt(1 + (t1/t2.^2)) + (t1/t2))*rad;
	
end

function [r]  = getCLmax(clmax, a, ao)
	r = clmax*(a/(0.85*ao));
end

function [r]  = getCLmd(a, alphao)
	r = -0.5 * a * alphao;
end

function [r] = getPhi(h, b)
    num = ((16 * h) / b).^2;
    den = 1 + num;
    r = num / den;
end

function [r]  = getCLto(CLmd, mu, phi, K)
	r = CLmd+(mu/(2 * phi * K));
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
