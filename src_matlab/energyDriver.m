sizes = [5000, 7500, 10000, 12500];
for j = 1:4
    A = rand(sizes(j), 3);
    fprintf("Trial %d for iterative Energy: ", j)
    tic
    del = oldEnergy(A, 2);
    toc
end
for j = 1:4
    A = rand(sizes(j), 3);
    fprintf("Trial %d for vectorized Energy: ", j)
    tic
    del = energy(A, 2);
    toc
end