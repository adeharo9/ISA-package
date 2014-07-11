%% Temperature Calculation Function for the International Standard Atmosphere (ISA)
%This function calculates the temperature at a specified altitude.
%
%INPUT DATA
%   z --> Altitude (m)
%
%OUTPUT DATA
%   T --> Temperature (K)
                                                                          %Units
function [T]=ISA_T(z)
[T,~,~]=ISA(z);                                                           %K
end