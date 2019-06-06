function [ M ] = TaitBryan( a, b, c )
%EULER Returns the 4x4 hom. rotation matrix of the tait-bryan angles
%about a b and c in DEGREE about z x' z''

M = RotMatZ(a*pi/180) * RotMatY(b*pi/180) * RotMatX(c*pi/180);

end