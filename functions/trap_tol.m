function [I, N] = trap_tol(fun, a, b, tol)

N_max = 2048; % si impone comunque un limite superiore
err = 1;

N = 1;
I = trap_comp(fun, a, b, N);

while N <= N_max && err > tol
    N = 2 * N; % strategia di raddoppio del numero di sottointervalli
    Ik = trap_comp(fun, a, b, N);
    err = abs(I - Ik) / 3; % formula stima del resto con s = 2
    I = Ik;
end

if N > N_max
    disp("Maximum number of intervals reached!");
    I = [];
    N = [];
    return;
end

end