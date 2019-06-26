s = [10000, 15000, 20000, 25000]
k = [4, 8, 16, 32, 64]
fprintf("Trial with size of point configurations\n")
for l = 1:4
    fprintf("Trial with %d points: ", s(l))
    A = rand(s(l), 3);
    tic
    e = energy(KNNDist(A, 5), 2);
    toc
end
fprintf("Trial with differing values of \'k\' (n = 15000) \n")
A = rand(15000, 3);
for l = 1:5
    fprintf("Trial %d (k = %d): ", l, k(l))
    tic
    e = energy(KNNDist(A, k(l)), 2);
    toc
end