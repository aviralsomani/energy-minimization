function x = mls(P, curr_E, k, s, alph, f, val)
    n = size(P, 1);
    G = mGradient(P, s);
    PG = stepS2(P, G);
    step = retractAll(P-alph.*PG, f, val);
    next_E = truncatedEnergy(step, k, s);
    while (curr_E <= next_E)
        alph = 0.1*alph;
        step = retractAll(P-alph.*PG, f, val);
        next_E = truncatedEnergy(step, k, s);
    end
    t0=alph/2; t1=alph;
    e0 = curr_E;
    e2 = next_E;
    avg = mean(e0,e2);
    e1 = truncatedEnergy(retractAll(P-alph.*PG,f,val), k, s);
    if e1 > avg
        x = t1;
    else
        a = (e1*t1-e0*t1-e2*t0+e0*t0)/(t0^2*t1 - t0*2^2);
        b = (e1*t1^2-e0*t1^2-e2*t0^2+e0*t0^2)/(-t0^2*t1 + t0*t1^2);
        x = -b/(2*a);
    end
end

