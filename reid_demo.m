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
seg_mode            = 'six_stripes';    % Segmentation mode
img_ext             = '*.png';          % Image format. Note the default image format is png.

% Set paths
set_paths;

% Read images into dataset dir
[aaaa,bbbb,cccc] = read_dataset(pr_dir, gl_dir, img_ext, metric, seg_mode);