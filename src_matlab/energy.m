% function e = energy(points, s)
%     p = -1 * s;
%     n = size(points, 1);
%     sum = 0;
%     parfor i = 1:n-1
%         for j = (i + 1):n
%             no = norm(points(j, :) - points(i, :));
%             sum = sum + power(no, p);
%         end
%     end
%     e = sum;
% end

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

