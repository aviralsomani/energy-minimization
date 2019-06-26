% sizes = [5000, 10000, 15000, 20000]
% for j = 1:4
%     A = rand(sizes(j), 3);
%     fprintf("Trial %d for gradient: ", j)
%     tic
%     del = gradient(A, 2);
%     toc
% end
k = [3, 4, 5, 6, 7]
for j = 1:5
    A = rand(1000, 3);
    fprintf("Trial %d for energy with KNN (k=%d): ", j, k(j))
    fprintf(" - KNNDist Time: ")
    tic
    D = KNNDist(A, k(j));
    tic
    fprintf(" - Energy Time: ")
    tic
    e = energy(KNNDist(A, k(j)), 2);
    toc
end