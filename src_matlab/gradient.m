function [del] = gradient(P, s)
n = size(P, 1);
del = zeros(size(P));
val = zeros(size(P));
parfor i = 1:n
    val = zeros(size(P));
    cur = P(i, :);
    val = -1 * P + cur;
    norms = vecnorm(val,2,2).^(s+2);
    val = -2 * s * val;
    val = val./norms;
    val(i,:) = zeros(1, size(P,2));
    del(i,:) = sum(val);
end
end