sizes = [5000, 10000, 15000, 20000]
for j = 1:4
    A = rand(sizes(j), 3);
    fprintf("Trial %d for gradient: ", j)
    tic
    del = gradient(A, 2);
    toc
end