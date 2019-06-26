k = [3, 4, 5, 6, 7]
s = [10000, 15000, 20000, 25000]
for l = 1:5
    fprintf("Trial with %d points: \n", s(l))
    for j = 1:5
        A = rand(s(l), 3);
        fprintf("\tTrial %d for energy with KNN (k=%d): \n", j, k(j))
        fprintf("\t - KNNDist Time: ")
        tic
        tic
        D = KNNDist(A, k(j));
        toc
        fprintf("\t - Energy Time: ")
        tic
        e = energy(KNNDist(A, k(j)), 2);
        toc
        fprintf("\t - Total Time: ")
        toc
    end
end