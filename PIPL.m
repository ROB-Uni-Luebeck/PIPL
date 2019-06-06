function [ T, iter, Ekin ] = PIPL( p, q, varargin )
%(P)oint cloud registration (I)nspired by (P)hysics (L)aws framework
%
%   Author:     Philipp Jauer ( jauer@rob.uni-luebeck.de )
%                   Institute f�r Robotik und Kognitive Systeme
%                   - Universit�t zu L�beck -
%
%   Date:       July 2016
%
%   Version:    0.1
%
%   [tq, T] = FPR(p,q) Runs the parallel point cloud matching algorithm,
%   with p the model point set and q the template point set to
%   be registred. The output tq is the transformed template point cloud and
%   T is the 4x4 homogenous transformation to transform the template.
%   p and q have to be provided with the size of:
%       p - 3xN
%       q - 3xM
%
%       return:     T       The 4x4 homogeneouse transformation matrix
%                   iter    Number of iteration were done
%                   Ekin    The kinetic energies per iteration step
%
%   For additional information, see: (TODO:: wiki)
%
%   Additional settings and parameter are provided:
%
%   'Features'
%       Struct {f1, f2} with features, given as f1 - KxN and f2 KxM, where
%       K is the dimension of the feature space, N the number of point in
%       the model point set p and M the number of points in the template
%       point set.
%
%   'CUDA'
%       {true} | false
%       Runs the point cloud mathing on graphics processing unit using CUDA
%   'Matching'
%       {Gravitation} | LinFeat2Spat | LinFeat2SpatPM | Coulomb |
%                       CoulombPM | Hybrid
%       Specifies the matching method, which can be seen as metric of the
%       point correspondes (force modeling)
%
%   'NumPoints'
%       0 < x <= {default = 100}, with x a real value, which defines, how
%       many points of both point set (in %) will be compared (randomly
%       choosen) per iteration. Beside that, if GPU-compuation is enabled,
%       the maximum number of point is given by the maximum number of
%       threads of the GPU.
%
%   'CoolDown'
%       {default = 0.98}. A real value which defines the cool down factor
%       of the simulated annealing. The system cools down over time, with
%       T = T * CoolDown, starting at T = 1. The temperature T regulates
%       the movement of the reference point set. Lower T means less motion.
%
%   'Epsilon'
%       {default = 1e-4). The lower bound of the temperature T of the
%       simulated annealing process. If T < Epsilon then registration
%       process terminates.
%
%   'Visualize'
%       {false} | true
%       Simultaneouse rendering of the registration process. Note, that
%       this slows down the registration speed.
%
%   'Centroid'
%       {true} | false
%       Initially align both point clouds with respect to their centroids. 
%
%   Author: Philipp Jauer (jauer@rob.uni-luebeck.de)

matchingMethods = {'Gravitation', 'Coulomb', 'CoulombPM'}; % TODO: other methods has be added here

%% add relevant pathes
addpath('cuda');
addpath('math');
addpath('methods');

%% input parser and argument handling
in = inputParser;

in.addRequired('p', @(x)isreal(x) && size(x,1) == 3);
in.addRequired('q', @(x)isreal(x) && size(x,1) == 3);

in.addOptional('Features', [], @(x)isstruct(x) || isempty(x));

in.addOptional('CUDA', true, @(x)islogical(x));
in.addOptional('Method', @(x)any(strcmpi(x, matchingMethods)));
in.addOptional('CoolDown', 0.98, @(x)x > 0 && x < 1);
in.addOptional('Epsilon', 1e-4, @(x)isreal(x));
in.addOptional('NumPoints', 100, @(x)x > 0 && x <= 100);
in.addOptional('Visualize', false, @(x)islogical(x));
in.addOptional('Centroid', true, @(x)islogical(x));

in.parse(p,q, varargin{:});
args = in.Results;

clear in;

T = eye(4);

%% Iterate
if (args.CUDA == true)
    if(gpuDeviceCount > 0)
        [ T, iter, Ekin ] = IterateOnGPU(p, q, args);
    else
        warning('No CUDA enabled device detected! Computation will be done using the CPU.');
    end
else
   % TODO:: add CPU only version
   %[ T, iter, Ekin ] = IterateOnCPU(p, q, args);
end

end

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     