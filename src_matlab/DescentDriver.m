n = 1000;
k = n-1;
s = 2;
P = normrnd(0, 1, [n 3]);
P = normalize(P);
plotPoints(P);
[N, en, pg_ratio, err, alph] = optimizeEnergy(P, k, s, 0.001, 0.001, 5000, 0.0005);
% plotPoints(N);
x = 1:size(en, 1);
y = en';
% plot(x,y);
en(size(en, 1))