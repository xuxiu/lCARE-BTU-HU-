
function Out = LCARE_Loss(y, tau, th)

    n          = length(y);
    y_lag      = y(1 : n - 1);
    y_lag_plus = (max(zeros(n - 1, 1), y(1 : n - 1))).^2;
    y_lag_neg  = (min(zeros(n - 1, 1), y(1 : n - 1))).^2;
    sigma2     = th(5);
  
    Out = sum(CARE_logfun(y(2 : n) - th(1) - th(2) * y_lag - th(3) * y_lag_plus - th(4) * y_lag_neg, sigma2, tau));

end


