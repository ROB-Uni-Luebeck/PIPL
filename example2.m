%% Example 2:
% Registration of the coloured Uta teapot and its lid 

%% load and transform the point clouds
addpath('data');
addpath('math');

% model cloud
file = load('teapot2c.txt');
p = file(:,1:3)';
fp = file(:,4)';

% template cloud
file = load('teapot2c_deckel.txt');
qOrign = file(:,1:3)';
fq = file(:,4)';

% add an abitrary transformation to the template
M = TaitBryan(44, 30, -8) * TransMat([11, 9, -5]);

tmp = M* [qOrign(:, 1:length(qOrign)); ones(1,length(qOrign))];
q = tmp(1:3,:);

% show both clouds
figure(1);
clf;
hold on
scatter3(p(1,:), p(2,:), p(3,:), 50, fp, 'o');
scatter3(q(1,:), q(2,:), q(3,:), 50, fq, '+');
title('Misaligned model and template point cloud');
axis equal;

%% registration

% add features
feat = struct('p', fp, 'q', fq);

% start registration using default parameter, except visualisation and
% centroid pre-alignment

% set Visualize = false to skip the online rendering 

T = PIPL(p, q, 'Method', 'CoulombPM', 'Features', feat, 'Visualize', true, 'Centroid', false);
    
tmp = T* [q(:, 1:length(q)); ones(1,length(q))];
qReg = tmp(1:3,:);

rmse = RMSE(qOrign, qReg);

% show both clouds
figure(2);
clf;
hold on
scatter3(p(1,:), p(2,:), p(3,:), 50, fp, 'o');
scatter3(qReg(1,:), qReg(2,:), qReg(3,:), 50, fq, '+');
t = ['Model and template cloud after registration process with an RMSE of ' num2str(rmse)];
title(t);
axis equal;