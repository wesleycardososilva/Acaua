% -----------------------------------------------------------------------------------
% AeroGA: Genetic Algorithm used to optimize the shape of small-scale airplane wings
% Copyright (C) 2016  Daniel Kneipp de Sá Veira
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/gpl-3.0.html>.
% -----------------------------------------------------------------------------------

function cost = costFunc(solution)
    T = [0.100, 0.150; % ao
            -2.224, -0.050; % alphao   
             1.000,    1.300; % clmax
             2.303,    2.997];  % M
        %      min  max
     ao = solution(1);
     alphao = solution(2);
     clmax = solution(3);
     M = solution(4);
    
    cost = getFitness7(ao, alphao, clmax, M);
    %cost =getFitness5(0.134, -0.050, 1.240, 2.624);
   
    if (((solution(1) < 0.100) || (solution(1) > 0.150)) || ((solution(2) < -2.224) || (solution(2) > -0.050)) || ((solution(3) < 1.000) || (solution(3) > 1.300)) || ((solution(4) < 2.303) || (solution(4) > 2.997)))
         cost= abs(cost) *(-1); 
		
         %cost= 1e-15;
    end
    
   %if containsNegative(solution)
       % cost = 1e15;
    %else
        %Cl = solution(1);
        %Clmax = solution(2);
        %Cp = solution(3);
        
        %d = getDistance(Cl, Clmax, Cp);
        
        %if ~isreal(d)
            %cost = 1e15;
        %else
            %params = getParams(0);
            %dists = getParams('Dist');

            %cost = ((d*100))/Cp^2;

            %costRestrMax = 100 * max([0 (Cl - params(1,2))])^2 + ...
                           %100 * max([0 (Clmax - params(2,2))])^3 + ...
                           %10000 * max([0 (d - dists(2))])^3;

            %costRestrMin = 100 * max([0 ((-Cl) - (-params(1,1)))])^2 + ...
                           %100 * max([0 ((-Clmax) - (-params(2,1)))])^2 + ...
                           %1000 * max([0 ((-Cp) - (-params(3,1)))])^2 + ...
                           %10000 * max([0 ((-d) - (-dists(1)))])^2;

            %cost = cost * (1 + costRestrMax + costRestrMin);
        %end
   %end
   
  % cost= (solution(1)/solution(2)) - 200 * abs((solution(1) + solution(2)) - 2.8 );
end

function result = containsNegative(array)
    result = (sum(array < 0) ~= 0);
end
