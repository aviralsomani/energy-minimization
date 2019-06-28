A = -1 + 2 * normrnd(0,1, [50000 3]);
A = A./vecnorm(A, 2, 2);
scatter3(A(:, 1), A(:, 2), A(:, 3))