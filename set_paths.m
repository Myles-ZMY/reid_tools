% Set paths used in reid_demo script.
%
% Created by Angelo Cardellicchio, angelo.cardellicchio@poliba.it
%
% This code is release under BSD license.

% Use project folder as root folder
p_dir = pwd;

% Add libs to path
addpath(genpath(strcat(p_dir, '\libs\')));

% Set dataset directory
d_dir = strcat(p_dir, '\datasets\');

% Set probe set and gallery set dirs
switch dataset
    case 'custom'
        % Probe set
        pr_dir = strcat(d_dir, '\custom\pr_set\');
        % Gallery set
        gl_dir = strcat(d_dir, '\custom\gl_set\');
end

% Set res dir
res_dir = strcat(p_dir, '\res\');

if(isempty(res_dir))
    mkdir(res_dir)
end