function A = retractAll(A, f, gradf, val)
    for j = 1:size(A, 1)
        A(j,:) = retraction(A(j,:), f, gradf, val);
    end
end

