function e = iterEnergy(P, s)
    p = -1 * s;
    n = size(P, 1);
    sum = 0;
    parfor i = 1:n
        for j = (i+1):n
            no = norm(P(j, :) - P(i, :));
            sum = sum + power(no, p);
        end
    end
    e = sum;
end