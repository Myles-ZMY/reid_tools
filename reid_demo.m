% Main entry point for ambiguity rate evaluation.
%
% Created by Angelo Cardellicchio, angelo.cardellicchio@poliba.it
%
% This code is release under BSD license.

clear all; clc;

% Settings
norm_imgs           = 0;                % True if images should be normalized
dataset             = 'custom';         % Dataset
metric              = 'bhattacharyya';  % Metric
seg_mode            = 'six-stripes';    % Segmentation mode
img_ext             = '*.png';          % Image format. Note the default image format is png.

% Set paths
set_paths;

% Read images into dataset dir
[pr_segms, gl_segms, pr_his_h, pr_his_s, gl_his_h, gl_his_s] = read_dataset(pr_dir, gl_dir, img_ext, seg_mode);

% Compute distances between images in probe and gallery set
h_dist = compute_dist(pr_his_h, gl_his_h, metric, seg_mode);
s_dist = compute_dist(pr_his_s, gl_his_s, metric, seg_mode);

w_dist = (0.5*h_dist + 0.5*s_dist)/2;

match = zeros(size(w_dist,1),2);
for i = 1:size(w_dist,1)
    [match(i, 1), match(i, 2)] = min(w_dist(i,:));
end