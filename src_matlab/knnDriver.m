s = [10000, 15000, 20000, 25000]
for l = 1:4
    fprintf("Trial with %d points: ", s(l))
    A = rand(s(l), 3);
    tic
    e = energy(KNNDist(A, 5), 2)
    toc
end