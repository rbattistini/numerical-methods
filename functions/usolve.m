function [x, err] = usolve(U, b)

err = 0;
[n, m] = size(U);

if n ~= m
    printf('La matrice U non è quadrata!');
    x = [];
    err = 1;
    return;
end

% se almeno un elemento è nullo allora il risultato è false
if ~all(diag(U))
    disp('La matrice non è singolare');
    x = [];
    err = 1;
    return;
end

x = zeros(n,1); % preallocazione

% risoluzione backward (si specifica il passo -1)
for i = n:-1:1
    s = U(i, i + 1:n) * x(i + 1:n);
    x(i) = (b(i) - s) / U(i, i);
end

end