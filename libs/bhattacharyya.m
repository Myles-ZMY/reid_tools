function d = bhattacharyya( k, q )
%BHATTACHARRYA Computes the Bhattacharyya-coefficient based distance.
%   Detailed explanation goes here

d = real(sqrt(1-sum(sqrt(k.*q)))); % bhattacharyya metric
% d = -log(sum(sqrt(k.*q)));  % bhattacharyya distance
% d = sum(sqrt(k.*q));  % bhattacharyya coefficient

end