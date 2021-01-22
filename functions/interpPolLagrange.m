function [yy] = interpPolLagrange(x, y, xx)

n = length(x);

for j = 1:n
    % calcolo coefficienti j-esimo polinomio fondamentale di Lagrange
    x_zeri = [x(1:j-1) x(j+1:end)];
    p = poly(x_zeri);
    p = p / polyval(p, x(j));
    % calcolo valori assunti dal polinomio
    L(j,:) = polyval(p, xx);
end

yy = y * L;

end