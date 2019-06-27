s = [10000, 15000, 20000, 25000]
k = [32, 64, 128, 256, 512]
% fprintf("Trial with size of point configurations (k = 5)\n")
% for l = 1:4
%     fprintf("Trial with %d points: ", s(l))
%     A = rand(s(l), 3);
%     tic
%     e = energy(KNNDist(A, 5), 2);
%     toc
% end
% fprintf("Trial with differing values of \'k\' (n = 10000) \n")
% for l = 1:5
%     fprintf("Trial %d (k = %d): ", l, 100)
%     tic
%     e = energy(KNNDist(A, 100), 2);
%     toc
% end

for l = 1:5
    fprintf("Trial for %d points: ", s(l))
    A = rand(s(l), 3);
    tic
    F = KNNDist(A, 100);
    toc
    tic
    e = energy(F, 2);
    toc
end
