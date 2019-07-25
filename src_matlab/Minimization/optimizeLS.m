function [out, en, pg_ratio, err] = optimizeLS(P, k, s, alph, eps, maxstep, prop)
    err = 1;
    out = zeros(size(P));
    en = energy(KNNDist(P, k), s);
    step = 1;
    L1Proj_sum = 0;
    L1Grad_sum = 0;
    pg_ratio = 1;
    while(err >= eps && step <= maxstep && pg_ratio >= prop)
        [~,grad] = mGradient(P, s);
        alph = lineSearch(P, en(size(en)), s, alph);
        for i = 1:size(P, 1)
            proj = step_S2(P(i,:), grad(i, :))
            L1Proj_sum = L1Proj_sum + norm(proj);
            L2Grad_sum = L1Grad_sum + norm(grad);
            next_x = P(i, :) - alph .* (proj);
            next_x = normalize(next_x);
            out(i,:) = next_x;
        end
        
        en = [en
              energy(KNNDist(out, k), s)];
        err = abs(en(size(en,1)) - en(size(en, 1) - 1));
        P = out;
        step = step + 1;
        pg_ratio = L1Proj_sum/L1Grad_sum;
    end
end

