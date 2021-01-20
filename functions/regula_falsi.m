function [sol, appr, nit] = regula_falsi(fun, a, b, tolx, maxit)

% valutazione agli estremi
fun_a = fun(a);
fun_b = fun(b);

if(sign(fun_a) == sign(fun_b))
   error("Teorema degli Zeri non applicabile") 
end

nit = 0;
exit = 0;
fun_app = fun_a;
appr = zeros(1, 10);

% due criteri di arresto, uno sul massimo numero di iterazioni,
% l'altro sul controllo di |tol|, considerando |eps|
while exit == 0 && nit <= maxit ...
    && abs(b - a) >= tolx + eps * max(abs(a), abs(b))
    %%&& abs(fun_app) >= tolx

    nit = nit + 1;
    
    % calcolo intersezione con l'asse x della retta che
    % congiunge gli estremi a e b
    appr(nit) = a - fun_a * (b - a) / (fun_b - fun_a);
    fun_app = fun(appr(nit));
    
    if(fun_app == 0) % lo zero è stato trovato
        exit = 1;
    end
    
    % aggiornamento sotto-intervallo di sinistra
    if(sign(fun_app) == sign(fun_a)) 
        a = appr(nit);
        fun_a = fun_app;
    % aggiornamento sotto-intervallo di destra
    elseif(sign(fun_app) == sign(fun_b))
        b = appr(nit);
        fun_b = fun_app;
    end    
end

if(nit == maxit)
   disp("Raggiunto il massimo numero di iterazioni") 
end

% l'ultima approssimazione è la migliore soluzione 
% a cui si è giunti in maxit
sol = appr(nit);

end