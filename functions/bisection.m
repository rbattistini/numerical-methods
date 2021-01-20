function [sol, appr, nit] = bisection(fun, a, b, tolx)

fun_a = fun(a);
fun_b = fun(b);

if(sign(fun(a)) == sign(fun(b)))
   error("Teorema degli Zeri non applicabile"); 
end

nit = 0;
exit = 0;
maxit = ceil((log(fun_b - fun_a) / tolx) / log(2));
appr = zeros(1, 10); % preallocazione

while exit == 0 && nit <= maxit ...
    && abs(b - a) >= tolx + eps * max(abs(a), abs(b))
    
    nit = nit + 1;
    appr(nit) = a + (b - a) / 2; % ascissa
    fun_app = fun(appr(nit)); % ordinata
    
    if(sign(fun_app)) == sign(fun_a) % sposto a verso destra
        a = appr(nit);
        fun_a = fun_app;
    elseif(sign(fun_app) == sign(fun_b)) % sposto b verso sinistra
        b = appr(nit);
        fun_b = fun_app;
    end
    
    if(fun(appr) == 0)
        exit = 1;
    end
end

sol = appr(nit);

end