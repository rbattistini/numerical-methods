function [a] = QRmethod(x, y, n)

l = length(x);
H_completa = vander(x);

%{
dati n + 1 punti per il polinomio di grado n
si prelevano le colonne da l-n a l. Il grado del 
polinomio determina le prime n colonne scartate
%}
H = H_completa(:, l - n : l);

[Q, R] = qr(H);
R_1 = R(1 : n + 1, :);
y_1 = Q' * y;
y_1 = y_1(1 : n + 1);

a = usolve(R_1, y_1);

end