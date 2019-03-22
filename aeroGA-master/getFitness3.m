%ao 	0.100 	0.150 	(o)-1 	Coeficiente linear curva cl-alfa perfil
%M 		2.303 	2.997 	Kg 		Massa total(massa vazio +massa carga paga) na decolagem
%alphao -2.224 	-0.050 	o 		Alfa para sustentação nula
%clmax 	1.000 	1.300 	adm 	Coeficiente de sustentação m


%getFitness2(0.1, 2.303, -2.224, 1.000)
%getFitness2(0.125, 2.605, -1.435, 1.105)
%getFitness2(0.150, 2.997, -0.050, 1.300)

function [fitness] = getFitness3(ao, M, alphao, clmax)%baseado nas variáveis geradas
    fitness = ao + alphao + clmax + M;
end