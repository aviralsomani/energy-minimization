function [e] = truncatedEnergy(P, k, s)
    e = sum(knnDist(P, k).^(-1*s), 'all')/2;
end

