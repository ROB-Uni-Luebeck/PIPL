function [ M ] = EulerAngles( a, b, c )
%EULERANGLES Returns the 4x4 hom. rotation matrix of the euler transformation
%about a b and c in DEGREE about z x' z''

M = RotMatZ(c*pi/180) * RotMatX(b*pi/180) * RotMatZ(a*pi/180);

end

