function [e] = weightedEnergy(P, rho, s, d)
    e = 0;
    n = size(P, 1);
    for j = 1:n
        for k = 1:n
            if j ~= k
                e = e + rho(P(j,:)).^(-1*s/d)*norm(P(j,:)-P(k,:)).^(-1*s);
            end
        end
    end
    e = e/2;
end