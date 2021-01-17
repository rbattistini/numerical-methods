function [L, U, flag] = gauss_simple(A)

    [n,m] = size(A);
    flag = 0;

    if n ~= m, 
        disp('errore: matrice non quadrata'), 
        L = []; 
        U = []; 
        P = []; 
        err = 1; 
        return, 
    end

    U = A;

    for k=1:n-1

        if U(k,k) ==  0,
            disp('elemento diagonale nullo'), 
            L = []; 
            e = 1; return, end
        %Eliminazione gaussiana
        U(k+1:n,k)=U(k+1:n,k)/U(k,k);                         
        U(k+1:n,k+1:n)=U(k+1:n,k+1:n)-U(k+1:n,k)*U(k,k+1:n);
    end

    L=tril(U,-1)+eye(n); % Estrae i moltiplicatori 
    U=triu(U);           % Estrae la parte triangolare superiore + diagonale
end