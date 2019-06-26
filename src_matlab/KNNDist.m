function D = KNNDist(P, k)
n = size(P, 1);
D = zeros(n, k)
A = zeros(n-1, k);
for j = 1:n
    if (j == 1)
        A = P(2:n, :);
    else
        A = [P(1:j-1, :)
            P(j+1:n, :)];
    end
    [dists] = knnsearch(A,P1,'K',k);
    D(j, :) = dists';
end
end

