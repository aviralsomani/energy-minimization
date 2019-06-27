function D = KNNDist(P, k)
n = size(P, 1);
D = zeros(n, k);
dists = zeros(k, 1)
parfor j = 1:n
    if (j == 1); [~,dists] = knnsearch(P(2:n),P(j,:),'K',k);
    else; [~,dists] = knnsearch([P(1:j-1,:)
                    P(j+1:n,:)],P(j,:),'K',k);
    end
    D(j, :) = dists';
end
end

