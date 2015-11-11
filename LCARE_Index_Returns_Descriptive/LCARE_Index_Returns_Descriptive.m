% ---------------------------------------------------------------------
% Project:      LCARE
% ---------------------------------------------------------------------
% Quantlet:     LCARE_Index_Returns_Descriptive
% ---------------------------------------------------------------------
% Description:  LCARE_Index_Returns_Descriptive provides descriptive 
%               statistics for the selected index return time series 
%               from 3 January 2005 to 31 December 2014 (2608 trading 
%               days): mean, median, minimum (Min), maximum (Max), 
%               standard deviation (Std), skewness (Skew.) and kurtosis
%               (Kurt.)
% ---------------------------------------------------------------------
% Keywords:     risk management, index, returns, time-series, dax,
%               ftse, mean, median, standard deviation, skewness and 
%               kurtosis 
% ---------------------------------------------------------------------
% See also:     LCARE_Index_Returns
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20151107
% ---------------------------------------------------------------------

clear all; clc;

data   = load('DataIndices.dat');
r_DAX  = diff(log(data(:, 1)));       % r_DAX daily data
r_FTSE = diff(log(data(:, 2)));       % r_FTSE daily data
r_SP   = diff(log(data(:, 3)));       % r_SP daily data

r                         = [r_DAX r_FTSE r_SP];
LCARE_Index_Returns_Table = [(mean(r))' (median(r))' (min(r))' (max(r))'...
                            (std(r))' (skewness(r))' (kurtosis(r))'];

save('LCARE_Index_Returns_Table', 'LCARE_Index_Returns_Table', '-ascii');
