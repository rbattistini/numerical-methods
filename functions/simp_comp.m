function I = simp_comp(f, a, b, N)

% passo di campionamento (doppio rispetto ai trapezi), dato che effettua
% un'interpolazione quadratica, sfruttando una parabola
h = (b - a) / (2 * N); 
x = (a:h:b); % nodi equispaziati

y = f(x); % vettore contenente le valutazioni della funzione

I = (y(1) + 2 * sum(y(3:2:2*N-1)) + 4 * sum(y(2:2:2*N)) ...
    + y(2 * N + 1)) * h/3; % passo 2 per iterare sui nodi dispari
% formula di Simpson composita
% a = 1
% b = 2*N + 1
% 2 -> N come 3 -> N - 1

end