function [del] = mGradient(P, s)
n = size(P, 1);
del = zeros(size(P));
for i = 1:n
    val = -1 * P + P(i, :);
    norms = vecnorm(val,2,2).^(s+2);
    val = -2 * s * val;
    val = val./norms;
    val(i,:) = zeros(1, size(P,2));
    del(i,:) = sum(val);
end
end