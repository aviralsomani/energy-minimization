function e = energy(P, s)
    p = -1 * s;
    n = size(P, 1);
    D = zeros(n, n);
    parfor i = 1:n
        D(i,:) = vecnorm(P - P(i,:),2,2)';
    end
    D = D + eye(size(D, 1));
    %e = sum(sum(triu(D .^ p, 1)));
    e = sum(D.^p, 'all') - n;
end

% function e = energy(dists, s)
%     e = sum(dists.^(-1*s), 'all')/2;
% end

% function e = energy(P, k, s)
%     e = sum(KNNDist(P, k).^(-1*s), 'all'));
% end

