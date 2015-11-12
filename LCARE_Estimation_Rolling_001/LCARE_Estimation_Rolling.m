
function Out = LCARE_Estimation_Rolling(y, rolling, first, tau)

[n, ~] = size(y);
para   = zeros(n - first + 1, 5);

for i = first : 1 : n
    
    y_esti                 = y(i - rolling : i, 1);                
    th_est                 = LCARE_Estimation(y_esti, tau);     
    para(i - first + 1, :) = th_est(1 : 5)';
    
end

Out = para;


