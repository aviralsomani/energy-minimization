function D = KNNDist(P, k)
n = size(P, 1);
D = zeros(n, k);
parfor j = 1:n
    if (j == 1); dists = knnsearch(A,P1,'K',k);
    else; knnsearch([P(1:j-1,:)
                    P(j+1:n,:)]);
    end
    D(j, :) = dists';
end
end

