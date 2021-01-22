function [a] = NEmethod(x, y, n)

l = length(x);
H_completa = vander(x);

%{
dati n + 1 punti per il polinomio di grado n
si prelevano le colonne da l-n a l
il grado del polinomio determina le prime n colonne scartate
%}

H = H_completa(:, l - n : l); 

% Risolve il sistema delle equazioni normali H' ∗ H a = H' y
% con fattorizzazione di Cholesky
A = H' * H;
b = H' * y;
[R, p] = chol(A);

% A non è definita positiva (anche all(eig(A) > 0 == 1), usando gli autovalori)
if p > 0
    a = A \ b;
else % A è definita positiva
% si ottiene una fattorizzazione del tipo: A = L * L'
% A x = b si spezza in L z = b e L' x = z
    b1 = lsolve(R' , b);
    a = usolve(R, b1);
end

%{
oppure, con A definita positiva:

[R, p] = chol(A, "lower");
b1 = lsolve(R , b);
a = usolve(R', b1);
%}

end