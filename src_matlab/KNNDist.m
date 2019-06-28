function D = KNNDist(P, k)
n = size(P, 1);
D = zeros(n, k);
% parfor j = 1:n
%     if (j == 1); [~,dists] = knnsearch(P(2:n,:),P(j,:),'k',k)
%     else; [~,dists] = knnsearch([P(1:j-1,:)
%                                 P(j+1:n,:)],P(j,:),'k',k)
%     end
%     D(j, :) = dists';
% end
A = zeros(n-1, k);
parfor j = 1:n
    if (j == 1)
        A = P(2:n, :);
    else
        A = [P(1:j-1, :)
            P(j+1:n, :)];
    end
    [~, dists] = knnsearch(A,P(j,:),'k',k);
    D(j, :) = dists';
end
end

