P = normrnd(0, 1, [10000 3]);
P = P./vecnorm(P, 2, 2);

function [gProj] = stepS2(x)
proj = x/norm(x);
end