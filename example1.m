%% Example 1:
% Registration of a high-resolution point cloud,
% downloaded from the Large Geometric Model Archive of the
% Georgia Institute of Technology
% URL: http://www.cc.gatech.edu/projects/large_models/
%
% For this example the Computer Vision System Toolbox and
% and 3-D Point Cloud Processing is required!

%% load and transform the point clouds
addpath('data/LargeGeometricModelsArchive');
addpath('math');

% model cloud
Model = pcread('hand.ply');

% scale cloud
S = eye(4).*20;
S(4,4) = 1;
Model = pctransform(Model, affine3d(S'));

% add an abitrary transformation to the template
M = TaitBryan(20, 10, -13.8) * TransMat([15, 11, -6]);
Template = pctransform(Model, affine3d(M'));

% show both clouds
figure(1);
clf;
pcshowpair(Model, Template);
title('Misaligned model and template point cloud')

%% registration

% start registration using default parameter, except visualisation and
% centroid pre-alignment

% set Visualize = false to skip the online rendering 

T = PIPL(Model.Location', Template.Location', 'Visualize', true, 'Centroid', false);
    
Template = pctransform(Template, affine3d(T'));

rmse = RMSE(Model.Location', Template.Location');

% show both clouds
figure(2);
clf;
pcshowpair(Model, Template);

t = ['Model and template cloud after registration process with an RMSE of ' num2str(rmse)];
title(t)