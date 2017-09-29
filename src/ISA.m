%% International Standard Atmosphere (ISA)
%This function models the International Standard Atmosphere (ISA) between 0
%and 47000 m from the surface.
%
%INPUT DATA
%   z --> Altitude (m)
%
%OUTPUT DATA
%   T --> Temperature (K)
%   P --> Pressure (Pa)
%   rho --> Density (kg/m^3)
                                                                          %Units
function [T,P,rho]=ISA(z)
%-------------------- GLOBAL CONSTANTS ------------------------------------
g=9.80665;                                                                %m/s^2
R=8.314472;                                                               %J/mol·K
M=28.97E-3;                                                               %kg/mol
%-------------------- TROPOSPHERE -----------------------------------------
if z<11000                                                                %m
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T0,P0,rho0]=parmCalc(z);                                      %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    T=T0+lambda*z;                                                        %K
    P=P0*(T/T0).^(-g*M/(R*lambda));                                       %Pa
    rho=rho0*(T/T0).^(-g*M/(R*lambda)-1);                                 %kg/m^3
%-------------------- LOW STRATOSPHERE ------------------------------------
elseif z<25000                                                            %m
    %---------------- CONSTANTS -------------------------------------------
    [~,T11000,P11000,rho11000]=parmCalc(z);                               %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    T=T11000;                                                             %K
    P=P11000*exp(-g*M*(z-11000)/(R*T));                                   %Pa
    rho=rho11000*exp(-g*M*(z-11000)/(R*T));                               %kg/m^3
%-------------------- HIGH STRATOSPHERE -----------------------------------
elseif z<47000                                                            %m
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T25000,P25000,rho25000]=parmCalc(z);                          %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    T=T25000+lambda*(z-25000);                                            %K
    P=P25000*(T/T25000).^(-g*M/(R*lambda));                               %Pa
    rho=rho25000*(T/T25000).^(-g*M/(R*lambda)-1);                         %kg/m^3
%--------------------------------------------------------------------------
else
    error('Error. This function only calculates T,P and rho for h<47000m');
end
end