function e = vectorizedEnergy(P, s)
    p = -1 * s;
    n = size(P, 1);
    D = zeros(n, n);
    parfor i = 1:n
        D(i,:) = vecnorm(P - P(i,:),2,2)';
    end
    e = sum(sum(triu(D .^ p, 1)));
end

