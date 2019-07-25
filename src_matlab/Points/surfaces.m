t5590 = csvread('5590tangleapprox.csv');
n = 800;
P = t5590(1:n,:);
plotPoints(P);

% v = zeros([5590 1]);
% x = t5590(:,1);
% for j = 1:size(t5590,1)
%     v(j) = f(t5590(j,:));
% end

[output, energy, pg_ratio, err, alph] = mgd(P,100,@f,@gradf,0,1,0.01,0.001,1000,0.0005,false);

% 
% plotPoints(output);
% 
% function y = rho(x)
%     y = x(1)^2;
% end
% 
function y = f(x)
    y = x(1)^2*(x(1)^2-5) + x(2)^2*(x(2)^2-5) + x(3)^2*(x(3)^2-5)+11;
end

function dF = gradf(x)
    dF = [4*x(1)^3 + 10*x(1)
        4*x(2)^3 + 10*x(2)
        4*x(3)^3 + 10*x(3)];
end

