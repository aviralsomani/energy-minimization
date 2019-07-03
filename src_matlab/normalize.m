function [A] = normalize(A)
    A = A./vecnorm(A, 2, 2);
end

