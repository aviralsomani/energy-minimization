function [grad] = weightedGradient(P, rho, s, d)
    grad = [];
    n = size(P,1);
    for j = 1:n
        wxi = wgt(P(j,:));
        
        for k = 1:n
        end
    end
    function w = wgt(x)
        w = rho(x) ^ (-1*s/d)
    end
end

