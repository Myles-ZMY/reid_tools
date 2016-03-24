function [ dist ] = compute_dist( pr_h, gl_h, metric, seg_mode )
%COMPUTE_DIST Summary of this function goes here
%   Detailed explanation goes here
switch seg_mode
    case 'six-stripes'
        for i = 1:size(pr_h,1)
            for j = 1:size(gl_h,1)
                for k = 1:6
                    d(k) = bhattacharyya(pr_h{i,k}, gl_h{j,k});
                end
                dist(i,j) = mean(d);
            end
        end
        
        
end

end

