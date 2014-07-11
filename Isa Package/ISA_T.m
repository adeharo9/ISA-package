%% Temperature Calculation Function for the International Standard Atmosphere (ISA)
%This function calculates the temperature at a specified altitude.
%
%INPUTS
%   z --> Altitude (m).
%
%OUTPUTS
%   T --> Temperature (K).
                                                                          %Units
function [T]=ISA_T(z)
[T,~,~]=ISA(z);                                                           %K
end