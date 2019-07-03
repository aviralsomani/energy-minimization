function e = oldEnergy(points, s)
    p = -1 * s;
    n = size(points, 1);
    sum = 0;
    parfor i = 1:n-1
        for j = (i + 1):n
            no = norm(points(j, :) - points(i, :));
            sum = sum + power(no, p);
        end
    end
    e = sum;
end