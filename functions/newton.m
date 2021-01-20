function [sol, appr, nit] = newton(fun, fun_der, x_i, tolx, tolf, maxit)

m_i = fun_der(x_i); % inizializzazione della pendenza

if(abs(m_i) <= eps)
   fprintf('Derivata nulla in x_0, uscita...\n')
   sol = 0;
   appr = [];
   nit = 0;
   return
end

temp  = x_i - fun(x_i) / m_i; % primo passo di iterazione
fun_i = fun(temp); % prima approssimazione locale

nit = 1;
appr(nit) = temp;

% tre criteri di arresto, il primo sul numero di iterazioni massime,
% il secondo su
while nit < maxit && abs(fun_i / m_i) >= tolx * abs(appr(nit)) ...
    && abs(fun_i) >= tolf

    x_i = appr(nit);

    m_i = fun_der(x_i); % ricalcolo della pendenza
    if(abs(m_i) <= eps)
        fprintf('Derivata nulla in x_0, uscita...\n')
        sol = appr(nit);
        return
    end
    
    temp = x_i - fun_i / m_i; % calcolo nuova soluzione
    fun_i = fun(temp); 
    
    nit = nit + 1;
    appr(nit) = temp;
end

if(maxit == nit)
   disp("Raggiunto massimo numero iterazioni") 
end

sol = appr(nit);

end