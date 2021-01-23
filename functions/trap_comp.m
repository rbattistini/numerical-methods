function I = trap_comp(f, a, b, N)
% passo di campionamento, effettua un'interpolazione lineare, sfruttando una retta
h = (b - a) / N; 
x = (a:h:b); % nodi equispaziati

y = f(x); % vettore contenente le valutazioni della funzione

I = (y(1) + 2 * sum(y(2:N)) + y(N + 1)) * h / 2;
% formula dei trapezi di quadratura composita
% a = 1
% b = N + 2
% da 2 a N come da 1 a N - 1

end