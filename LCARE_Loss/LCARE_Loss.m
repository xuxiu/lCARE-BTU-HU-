% ---------------------------------------------------------------------
% Project:      LCARE
% ---------------------------------------------------------------------
% Quantlet:     LCARE_Loss
% ---------------------------------------------------------------------
% Description:  LCARE_Loss evaluates the loss function for data given
%               a CARE parameter
% ---------------------------------------------------------------------
% Usage:        LCARE_Loss(y, tau)
% ---------------------------------------------------------------------
% Inputs:       y - (n x 1) data
%               tau - (1 x 1) expectile level
%               th - (4 x 1) parameter vector
% ---------------------------------------------------------------------
% Output:       Out - (1 x 1) evaluated loss function
% ---------------------------------------------------------------------
% Keywords:     risk management, estimation, parameter, loss-function,
%               optimization
% ---------------------------------------------------------------------
% See also:     LCARE_Estimation
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20151107
% ---------------------------------------------------------------------

function Out = LCARE_Loss(y, tau, th)
  n = length(y);
  y_lag = y(1 : n - 1);
  y_lag_plus = (max(zeros(n-1,1),y(1 : n - 1))).^2;
  y_lag_neg = (min(zeros(n-1,1),y(1 : n - 1))).^2;
  sigma2 = th(5);
  
  Out = sum(CARE_logfun(y(2 : n) - th(1) - th(2) * y_lag - th(3) * y_lag_plus - th(4) * y_lag_neg, sigma2, tau));
end


