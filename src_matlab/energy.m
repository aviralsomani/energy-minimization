function e = energy(P, s)
    p = -1 * s;
    n = size(P, 1);
    D = zeros(n, n);
    parfor i = 1:n
        D(i,:) = vecnorm(P - P(i,:),2,2)';
    end
    D = D .^ p;
    D = triu(D, 1);
    e = sum(D, 'all');
end

% function e = energy(dists, s)
%     e = sum(dists.^(-1*s), 'all')/2;
% end

% function e = energy(P, k, s)
%     e = sum(KNNDist(P, k).^(-1*s), 'all'));
% end

