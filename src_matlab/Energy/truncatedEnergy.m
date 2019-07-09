function [e] = truncatedEnergy(P, k, s)
    e = sum(KNNDist(P, k).^(-1*s), 'all')/2;
end

