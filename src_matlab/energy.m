% function e = energy(points, s)
%     p = -1 * s;
%     n = size(points, 1);
%     sum = 0;
%     parfor i = 1:n-1
%         for j = (i + 1):n
%             no = norm(points(j, :) - points(i, :));
%             sum = sum + power(no, p);
%         end
%     end
%     e = sum;
% end

function e = energy(dists, s)
    p = -1 * s; n = size(dists, 1); e = 0;
    parfor j1 = 1:n
        for j2 = 1:n-1
            e = e + power(dists(j1, j2), p)
        end
    end
end

