function [I, N] = simp_tol(fun, a, b, tol)

N_max = 2048;
err = 1;

N = 1;
I = simp_comp(fun, a, b, N);

while N <= N_max && err > tol
    N = 2 * N; % strategia di raddoppio del numero di sottointervalli
    Ik = simp_comp(fun, a, b, N);
    err = abs(I - Ik) / 15; % formula stima del resto con s = 4
    I = Ik;
end

if N > N_max
    disp("Maximum number of intervals reached!");
    I = [];
    N = [];
    return;
end

end