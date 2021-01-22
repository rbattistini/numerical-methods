function [yy] = interpPolNewton(x, y, xx)

% FASE 1 creazione della tabella delle differenze divise
% Calcolo dei coefficienti del polinomio di Newton

n = length(x);
%for k = 2 : n % si calcolano n - 1 colonne (una per coeff.)
 %   y(k:n) = (y(k:n) - y(k-1:n-1))./(x(k:n) - x(1:n-k+1));
%end
for k = 1 : n-1
    y(k+1:n) = (y(k+1:n) - y(k)) ./ (x(k+1:n) - x(k));
end

coeff = y; % diagonale della tabella delle differenze divise.

% si ottiene il vettore dei coefficienti per cui vale p(x(i)) = y(i)
% dove p(x) = c(1) + c(2)(x - x(1)) + ... + c(n)(x - x(1))...(x - x(n - 1))

% FASE 2 applicazione algoritmo di Horner
% Calcolo dei valori del polinomio di Newton nel vettore y.

n = length(coeff);
yy = coeff(n) * ones(size(xx)); 

for k = n - 1: -1 : 1
    yy =  (xx - x(k)).*yy + coeff(k);
end


% Si ottiene yy(i) = p(xx(i))
% dove p(x) = c(1) + c(2)(x - x(1)) + ... + c(n)(x - x(1))...(x - x(n - 1))

end