function [sol, appr, nit] = chords(fun, fun_der, x_i, tolx, tolf, maxit)

nit = 1;
m = fun_der(x_i); % calcolo della pendenza costante
appr(nit) = x_i - fun(x_i) / m; % primo passo di iterazione
fun_i = fun(appr(nit)); % prima approssimazione locale

while nit < maxit && abs(fun_i / m) >= tolx * abs(appr(nit)) ...
        && abs(fun_i) >= tolf
    x_i = appr(nit);

    temp = x_i - fun_i / m;
    fun_i = fun(temp);
    
    nit = nit + 1;
    appr(nit) = temp;
end

if(maxit == nit)
   disp("Maximum number of iterations reached!");
end

sol = appr(nit);

end