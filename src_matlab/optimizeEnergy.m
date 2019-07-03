function [P_next, en, pg_ratio, err, alph] = optimizeEnergy(Pfn, s, alph, eps, maxstep, prop)
    P = Pfn;
    step = 1;
    pg_ratio = 1;
    fprintf("Step count: 1");
    en = zeros(maxstep+1, 1);
    en(step) = energy(P, 2);
    while (step <= maxstep && pg_ratio >= prop)
        if step == 1
            fprintf("\b")
        else
            for j = 1:(log10(step - 1) + 1)
                fprintf("\b");
            end
        end
        fprintf("%d", step);
        step = step + 1;
        [G] = gradient(P, s);
        Proj = step_S2(P, G);
        L1Proj_sum = sum(vecnorm(Proj, 2, 2));
        L1Grad_sum = sum(vecnorm(G, 2, 2));
        P_next = P - alph * Proj;
        P_next = P_next./vecnorm(P_next, 2, 2);
        en(step) = energy(P, s);
        plot(en);
        err = abs(en(size(en, 1)) - en(size(en,1)-1));
        P = P_next;
        pg_ratio = L1Proj_sum/L1Grad_sum;
        if pg_ratio > 0.1 && err/alph < eps
            alph = alph/1.005;
        end
    end
end
