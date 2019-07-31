function [output, energy, pg_ratio, err, alph] = mgd(P, k, f, gradf, val, s, alph, eps, maxstep, prop, stoch)
    err = 1;
    n = size(P, 1);
    output = zeros(size(P));
    energy = zeros([maxstep + 1,1]);
    step = 1;
    l1sumproj = 0;
    l1sumgrad = 0;
    pg_ratio = 1;
    energy(step) = vectorizedEnergy(P, s);
    
    while (step <= maxstep && pg_ratio >= prop)
        [grad] = mGradient(P, s);
        for j = 1:n
            x = P(j,:);
            gradEx = grad(j,:);
            proj = stepS2(x, gradEx);
            l1sumproj = l1sumproj + norm(proj);
            l1sumgrad = l1sumgrad + norm(gradEx);
            if stoch
                x_n = x - alph .* (gradEx + (alph/2 * rand([3 1])));
            else
                x_n = x - alph .* gradEx;
            end
            x_n = retraction(x_n, f, gradf, val);
            output(j,:) = x_n;
        end
        step = step + 1;
        energy(step) = vectorizedEnergy(P, s);
        P = output;
        pg_ratio = l1sumproj/l1sumgrad;      
        if pg_ratio > 0.1 && err/alph > eps
            alph = alph/1.005;
        end
    end
end

