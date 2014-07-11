%% Pressure Calculation Function for the International Standard Atmosphere (ISA)
%This function calculates the pressure at a specified altitude.
%
%INPUT DATA
%   z --> Altitude (m)
%
%OUTPUT DATA
%   P --> Pressure (Pa)
                                                                          %Units
function [P]=ISA_P(z)
[~,P,~]=ISA(z);                                                           %Pa
end