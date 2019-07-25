function [output, energy, pg_ratio, err] = optimizeMLS(P, k, s, val, f, alph, eps, maxstep, prop)
    n = size(P,1);
    err = 1;
    output = zeros(size(P));
    energy = zeros(maxstep);
    step = 1;
    energy(step) = truncatedEnergy(P, k, s);
    pg_ratio = 1;
    while (err > eps && pg_ratio >= prop)
        G = mGradient(P, s);
        alph = mls(P, energy(step), k, s, alph, f, val);
        Proj = stepS2(P, G);
        l1sumproj = sum(vecnorm(Proj, 2, 2));
        l1sumgrad = sum(vecnorm(G, 2, 2));
        output = retraction(P - alph .* (Proj));
        step = step + 1;
        energy(step) = truncatedEnergy(output, k, s);
        err = abs(energy(step) - energy(step - 1));
        P = output;
        pg_ratio = l1sumproj/l1sumgrad;
    end
end

