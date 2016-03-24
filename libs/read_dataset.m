function [ varargout ] = read_dataset(pr_dir, gl_dir, img_ext, seg_mode)
%
% INSERIRE METRICA E SEG_MODE
  % ddir_pr è la probe set, ddir_gl è il gallery; metric è la metrica da
  % utilizzare, seg_mode è la modalità di segmentazione

% Set probe and gallery directories
pr_imgs = dir([pr_dir, img_ext]);
gl_imgs = dir([gl_dir, img_ext]);

n_pr_imgs = length(pr_imgs);
n_gl_imgs = length(gl_imgs);
% Segment images from probe and gallery set
pr_segms = cell(1, n_pr_imgs);
gl_segms = cell(1, n_gl_imgs);

switch seg_mode
    case 'six-stripes'
        % Resulting histograms
        pr_his_h = cell(n_pr_imgs, 6);
        pr_his_s = cell(n_pr_imgs, 6);
        gl_his_h = cell(n_gl_imgs, 6);
        gl_his_s = cell(n_gl_imgs, 6);
        % posso inventarmi un modo per farli in un unico if
        for i = 1:length(pr_segms)
            pr_segms{i} = ssseg(strcat(pr_dir, pr_imgs(i).name));
            % Extract HS normalized histograms
            for j = 1:length(pr_segms{i})
                [pr_his_h{i,j}, pr_his_s{i,j}] = rgb2hsnorm(pr_segms{i}{j});
            end
        end
        for i = 1:length(gl_segms)
            gl_segms{i} = ssseg(strcat(gl_dir, gl_imgs(i).name));
            for j = 1:length(gl_segms{i})
                [gl_his_h{i,j}, gl_his_s{i,j}] = rgb2hsnorm(gl_segms{i}{j});
            end
        end
end

varargout{1} = pr_segms;
varargout{2} = gl_segms;
varargout{3} = pr_his_h;
varargout{4} = pr_his_s;
varargout{5} = gl_his_h;
varargout{6} = gl_his_s;
end