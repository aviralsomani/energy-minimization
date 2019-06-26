k = [3, 4, 5, 6, 7]
s = [1000, 2000, 3000, 4000, 5000]
for j = 1:5
    fprintf("Trial with %d points: \n", s(j))
    for l = 1:5
        A = rand(s(l), 3);
        fprintf("\tTrial %d for energy with KNN (k=%d): \n", j, k(j))
        fprintf("\t - KNNDist Time: ")
        tic
        D = KNNDist(A, k(j));
        toc
        fprintf("\t - Energy Time: ")
        tic
        e = energy(KNNDist(A, k(j)), 2);
        toc
    end
end