%% Parameter function for ISA parameters
%This function returns the value of the parameters used in the ISA
%equations as function of altitude.
%
%INPUT DATA
%   z --> Altitude (m)
%
%OUTPUT DATA
%   lambda --> Temperature gradient (K/m)
%   T --> Reference temperature at a specified altitude (K)
%   P --> Reference pressure at a specified altitude (P)
%   rho --> Reference density at a specified altitude (kg/m^3)
                                                                          %Units
function [lambda,T,P,rho]=parmCalc(z)
%-------------------- TROPOSPHERE -----------------------------------------
if z<11000                                                                %m
    lambda=-6.5E-3;                                                       %K/m
    T=288.15;                                                             %K
    P=101325;                                                             %Pa
    rho=1.225;                                                            %kg/m^3
%-------------------- LOW STRATOSPHERE ------------------------------------
elseif z<25000                                                            %m
    lambda=0;                                                             %K/m
    T=216.65;                                                             %K
    P=22552;                                                              %Pa
    rho=0.3629;                                                           %kg/m^3
%-------------------- HIGH STRATOSPHERE -----------------------------------
elseif z<47000                                                            %m
    lambda=3E-3;                                                          %K/m
    T=216.65;                                                             %K
    P=2481;                                                               %Pa
    rho=0.0399;                                                           %kg/m^3
%--------------------------------------------------------------------------
end
end