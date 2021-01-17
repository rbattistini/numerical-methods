function [x, err] = lsolve(L, b)

err = 0;
[n, m] = size(L);

if n ~= m
    printf('La matrice L non è quadrata!');
    x = [];
    err = 1;
    return
end

% se almeno un elemento è nullo allora il risultato è false
if ~all(diag(L))
    printf('La matrice non è singolare');
    x = [];
    err = 1;
    return
end

x = zeros(n,1); % preallocazione

% risoluzione forward
for i= 1:n
    s = L(i, 1:i - 1) * x(1:i - 1);
    x(i) = (b(i) - s) / L(i, i);
end

end