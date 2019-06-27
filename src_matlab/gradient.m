function [val, del] = gradient(P, s)
n = size(P, 1);
del = zeros(size(P));
for i = 1:n
    val = 0;
    for j = 1:n
        if (j ~= i)
            val = val + (-2 * s * (P(i, :) - P(j, :)))/(norm(P(i, :) - P(j, :))^(s+2));
        end
    end
  del(i, :) = val;
end
end

