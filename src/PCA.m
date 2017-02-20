function [Y, V, mu] = PCA(X, n)
mu = mean(X, 1);
X = X - repmat(mu, size(X, 1), 1);
S = X' * X;

[~, ~, V] = svd(S);
V = V(:, 1:n);

Y = X * V;

end

