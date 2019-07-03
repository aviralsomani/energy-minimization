sizes = [50000, 60000, 70000, 80000];
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