function [ M ] = RotMatZ( a )
%ROTMATz Generates a homogenuous 4x4-matrix representing a rotation about the
%     z-axis given the angle a in radiant
%   
%input:
%   a   the angle to rotate about the x-axis in radiant
%
%return:
%   M   the matrix

M = [cos(a) -sin(a) 0 0; ...
     sin(a)  cos(a) 0 0; ...
     0       0      1 0; ...
     0       0      0 1];
 
 end