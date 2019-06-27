function [val, del] = vGradient(P, s)
n = size(P, 1);
del = zeros(size(P));
val = zeros([size(P) 3]);
parfor i = 1:n
    val = zeros([size(P) 3]);
    cur = P(i, :);
    val(:,:,1) = -1 * P + cur;
    val(:,:,3) = (-2 * s * val(:,:,1));
    norms = vecnorm(val(:,:,1), 2, 2);
    val(:,:,2) = val(:,:,3)./norms.^(s+2);
    val(i,:,2) = zeros(1, size(P,2));
    del(i,:) = sum(val(:,:,2));
end