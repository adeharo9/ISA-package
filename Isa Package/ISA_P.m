%% Pressure Calculation Function for the International Standard Atmosphere (ISA)
%This function calculates the pressure at a specified altitude.
%
%INPUTS
%   z --> Altitude (m).
%
%OUTPUTS
%   P --> Pressure (Pa).
                                                                          %Units
function [P]=ISA_P(z)
[~,P,~]=ISA(z);                                                           %Pa
end