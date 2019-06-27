sizes = [5000, 10000, 15000, 20000]
for j = 1:4
    A = rand(sizes(j), 3);
    fprintf("Trial %d for parfor gradient: ", j)
    tic
    del = gradient(A, 2);
    toc
end
for j = 1:4
    A = rand(sizes(j), 3);
    fprintf("Trial %d for vectorized gradient: ", j)
    tic
    del = vGradient(A, 2);
    toc
end