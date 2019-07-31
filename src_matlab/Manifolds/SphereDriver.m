n = 500;
s = 1;
P = normrnd(0, 1, [n 3]);
P = normalize(P);
% plotPoints(P);
tic
[output, energy, pg_ratio, err, alph] = mgd(P, 50, @sphere, @gradSphere, 1, 1, 0.0005, 0.0001, 2000, 0.005, false);
toc
% plotPoints(output);
csvwrite('config.csv', P)
function y = sphere(x)
    y = x(1)^2 + x(2)^2 + x(3)^2;
end

function delY = gradSphere(x)
    delY = [2 * x(1)
            2 * x(2)
            2 * x(3)];
end