function [alph] = lineSearch(P, curr_E, s, alph)
    proj_grad = zeros(size(P));
    grad = gradient(P, s);
    step = zeros(size(P));
    P_g = zeros(size(P, 2))
    
    for i = 1:size(grad, 1)
        P_g(i,:) = step_S2(P(i,:),grad(i,:));
    end
    step = P - alph.*P_g;
    normalize(step);
    next_E = energy(KNNDist(step, k), s);
    while (curr_E <= next_E)
        alph = 0.1*alph;
        step = P - alph.*P_g;
        normalize(step);
        next_E = energy(KNNDist(step, k), s);
    end
    t0 = 0; t1 = alph/2; t2 = alph;
    E_0 = curr_E;
    E_2 = next_E;
    avg = mean(E_0, E_2);
    E_1 = energy(KNNDist(normalize(P - t1.*P_g), k), s);
    if E_1 >= avg
        alph = t2;
    else
        a = (E_1*t2 - E_0*t2-E_2*t1+E_0*t1)/(t1^2*t2 - t1*t2^2);
        b = (E_1*t2^2 - E_0*t2^2 - E_2*t1^2 + E_0*t1^2)/(-t1^2*t2 + t1*t2^2);
        alph = -1*b/(2 * a);
    end
end

