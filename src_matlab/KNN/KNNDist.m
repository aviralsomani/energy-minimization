function D = KNNDist(P, k)
[~, D] = knnsearch(P, P, 'k', k+1);
D = D(:, 2:k+1);
end