n = 500;
s = 1;
% P = normrnd(0, 1, [n 3]);
P = csvread('points.csv');
P = normalize(P);
plotPoints(P);
[N, en, pg_ratio, err, alph] = optimizeEnergy(P, s, 0.001, 0.001, 5000, 0.005, false);
plotPoints(N);
x = 1:size(en, 1);
y = en';
plot(x,y);
disp(en(size(en,1)));