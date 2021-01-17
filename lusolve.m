function [x, err] = lusolve(L, U, P, Q, b)

if isempty(P) && isempty(Q)
    [y, err] = lsolve(L, b);
    if ~err
        [x, err] = usolve(U, y);
    else
        return
    end
elseif isempty(Q)
    Pb = P * b;
    [y, err] = lsolve(L, Pb);
    if ~err
        [x, err] = usolve(U, y);
    else
        return
    end
else
    Pb = P * b;
    [z, err] = lsolve(L, Pb);
    if ~err
        [y, err] = usolve(U, z);
        x = Q * y;
    else
        return
    end
end

end