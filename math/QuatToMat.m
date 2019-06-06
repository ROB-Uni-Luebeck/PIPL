function [ M ] = QuatToMat( q )
%QUATTOMAT Transform a quaternion in to a rotation matrix

M = ...
    [1 - 2*q(2)^2 - 2*q(3)^2, 2*q(1)*q(2) + 2*q(4)*q(3), 2*q(1)*q(3) - 2*q(4)*q(2);...
     2*q(1)*q(2) - 2*q(4)*q(3), 1 - 2*q(1)^2 - 2*q(3)^2, 2*q(2)*q(3) + 2*q(4)*q(1);...
     2*q(1)*q(3) + 2*q(4)*q(2),	2*q(2)*q(3) - 2*q(4)*q(1), 1 - 2*q(1)^2 - 2*q(2)^2];

    
end

