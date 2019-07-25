n = 10;
s = 1;
P = normrnd(0, 1, [n 3]);
P = normalize(P);
plotPoints(P);

[output, energy, pg_ratio, err, alph] = mgd(P, 50, @sphere, @gradSphere, 1, 1, 0.001, 0.001, 10000, 0.005, false);

plotPoints(output);

function y = sphere(x)
    y = x(1)^2 + x(2)^2 + x(3)^2;
end

function delY = gradSphere(x)
    delY = [2 * x(1)
            2 * x(2)
            2 * x(3)];
end