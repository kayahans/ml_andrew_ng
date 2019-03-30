function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = ones(size(X,1), 1);
n = size(X,1);
% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%


for i=1:K
	c_i = centroids(i,:); 
	if i == 1
		r2 = sum((X-c_i).^2,2);
	else
		r2_i = sum((X-c_i).^2,2);
		update = find(r2_i <= r2);
		r2(update) = r2_i(update);
		idx(update) = i;
	end
end




% =============================================================

end

