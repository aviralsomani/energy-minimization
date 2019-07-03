function [P_g] = step_S2(P, G)
    a = sum(G .* P, 2);
    P_g = G - a .* P;
end
