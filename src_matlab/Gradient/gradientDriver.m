sizes = [5000, 7500, 10000, 12500];
for j = 1:4
    A = rand(sizes(j), 3);
    fprintf("Trial %d for parfor gradient: ", j)
    tic
    del = oldGradient(A, 2);
    toc
end
for j = 1:4
    A = rand(sizes(j), 3);
    fprintf("Trial %d for vectorized gradient: ", j)
    tic
    del = gradient(A, 2);
    toc
end