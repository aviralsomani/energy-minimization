function del = gradient(points, s)
n = size(points, 1);
del = zeros(size(points));
for i = 1:n
    val = 0;
    for j = 1:n
        if (j ~= i)
            val = val + (-2 * s * (points(i, :) - points(j, :)))/(norm(points(i, :) - points(j, :))^(s+2));
        end
    end
    del(i, :) = val;
end
end

