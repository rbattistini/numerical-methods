function [L, U, P, Q, err] = gauss_total(A)

    [n,m]=size(A);
    err = 0;

    if n ~= m, 
        disp('errore: matrice non quadrata'),  
        L = []; 
        U = []; 
        P = []; 
        Q = []; 
        err = 1;
        return,
    end

    U = A;
    P = eye(n);
    Q = eye(n);
    for k = 1:n-1

        % Scelta pivot totale + scambi su U, P e Q 
        [temp_pivot, temp_ir_pivot] = max(abs(U(k:n, k:n)));
        [pivot, ic_pivot] = max(temp_pivot);
        ir_pivot = temp_ir_pivot(ic_pivot) + k - 1;
        ic_pivot = ic_pivot + k - 1;
        
        if pivot == 0,
            disp('pivot nullo'),
            L = [];
            err = 1;
            return,
        end
        
        if ir_pivot ~= k
            temp = U(k,:); 
            U(k,:) = U(ir_pivot,:); 
            U(ir_pivot,:) = temp;
            
            temp = P(k,:); 
            P(k,:) = P(ir_pivot,:); 
            P(ir_pivot,:) = temp; 
        end
        
        if ic_pivot ~= k
            temp = U(:,k); 
            U(:, k) = U(:, ic_pivot);
            U(:, ic_pivot) = temp;
            
            temp = Q(:, k); 
            Q(:, k) = Q(:, ic_pivot);
            Q(:, ic_pivot) = temp;
        end
        
        U(k+1:n, k) = U(k+1:n, k) / U(k,k);
        U(k+1:n, k+1:n) = U(k+1:n, k+1:n) - U(k+1:n, k) * U(k, k+1:n);
    end

    L = tril(U,-1) + eye(n); % Estrae i moltiplicatori
    U = triu(U);           % Estrae la parte triangolare superiore+diagonale

end