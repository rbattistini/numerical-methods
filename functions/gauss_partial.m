function [L, U, P, err] = gauss_partial(A)

    [n,m] = size(A);
    err = 0;
    
    if n ~= m, 
        disp('errore: matrice non quadrata'),  
        L = []; 
        U = []; 
        P = []; 
        err = 1;
        return,
    end

    U = A; 
    P = eye(n);
    
    for k = 1:n-1
    
    % Scelta pivot parziale + scambi su U e P
    [pivot, ir_pivot] = max(abs(U(k:n, k))); 
    ir_pivot = ir_pivot + (k-1); 
    
    if pivot == 0, 
        disp('pivot nullo'),
        L = []; 
        err = 1;
        return, 
    end
    
    if ir_pivot  ~= k
        temp = U(k,:);
        U(k,:) = U(ir_pivot,:);
        U(ir_pivot,:) = temp;
        
        temp = P(k,:); 
        P(k,:) = P(ir_pivot,:); 
        P(ir_pivot,:) = temp;
    end

    % Eliminazione gaussiana
    U(k+1:n, k) = U(k+1:n, k) / U(k, k); % Memorizza i moltiplicatori
    U(k+1:n, k+1:n) = U(k+1:n, k+1:n) - U(k+1:n, k) * U(k, k+1:n);
    end

    L = tril(U,-1) + eye(n); % Estrae i moltiplicatori 
    U = triu(U);           % Estrae la parte triangolare superiore+diagonale
end