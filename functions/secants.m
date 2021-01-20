function [sol, appr, nit] = secants(fun, x_i, x_j, tolx, tolf, maxit)

fun_i = fun(x_i);
fun_j = fun(x_j);

nit = 1;
exit = 0;

% inizializzazione tramite punti di innesco |x_i| e |y_i|
d = (x_i - x_j) / (fun_i - fun_j);
appr(nit) = x_i - fun_i * d;
fun_i = fun(appr(nit));

% criteri di arresto basati su |tolx|, |tolf| e |maxit|
while exit == 0 && nit < maxit ...
    && abs(fun_i * d) >= tolx * abs(appr(nit)) ...
    && abs(fun_i) >= tolf

    x_j = x_i;
    x_i = appr(nit);

    if(fun(x_i) == fun(x_j))
        exit = 1;
    end

    % costruzione i-esimo passo d'iterazione
    temp = x_i - fun(x_i) * (x_i - x_j) / (fun(x_i) - fun(x_j));
    % approssimazione locale
    fun_i = fun(temp); 

    nit = nit + 1;
    appr(nit) = temp;
end

if(nit == maxit)
    disp("Maximum number of iterations reached!");
end

sol = appr(nit);

end