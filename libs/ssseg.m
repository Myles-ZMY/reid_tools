function out_img = ssseg(img)
%SSSEG Segments image in six stripes.
%   This function splits image 'img' in six different stripes with the same
%   height, returning a cell array which contains the six different
%   stripes.

% Read input image
i = imread(img);
% Split image in six stripes
q = mod(size(i, 1), 6);
n = size(i, 1) - q;
out_img = mat2cell(i, [repmat(n/6, [1, 5]) (n/6 + q)]);

end