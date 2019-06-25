sizes = [100, 500, 1000, 5000, 10000]
for i = 1:5
    A = rand(sizes(i), 3);
    fprintf("Trial %d for gradient: ", i)
    tic
    del = gradient(A, 2);
    toc
end
for i = 1:5
    A = rand(sizes(i), 3);
    fprintf("Trial %d for energy: ", i)
    tic
    del = energy(A, 2);
    toc
end
    