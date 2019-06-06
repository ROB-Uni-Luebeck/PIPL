function [ rmse ] = RMSE( ref, corr )
%ERROREVAL Evaluation of the Root Mean Square Error of the correspondance
%cloud to the reference cloud

i = 1:size(ref,1);

diff = [ ref(i,1) - corr(i,1),...
      ref(i,2) - corr(i,2),...
      ref(i,3) - corr(i,3)];

e = sqrt(sum(diff.^2,2)); %error

se = e.^2;      % square error

mse = mean(se); % mean square error

rmse = sqrt(mse);   % root mean square error

end

