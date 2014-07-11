%% Altitude Calculation Function
%This function calculates the altitude in which the condition stablished as
%a parameter is correct.
%
%INPUTS
%   n --> String which can be:
%       'T' --> The parameter is a temperature (K).
%       'P' --> The parameter is a pressure (Pa).
%       'rho' --> The parameter is a density (kg/m^3).
%   v --> Value of n in the units specified above (IS).
%
%OUTPUTS
%   d --> Altitude in m that matches the specified condition.
                                                                          %Units
function [d]=altitudeCalc(n,v)
%-------------------- GLOBAL CONSTANTS ------------------------------------
syms z;
g=9.80665;
R=8.314472;
M=28.97E-3;
%-------------------- TEMPERATURE -----------------------------------------
if strcmp(n,'T')
%-------------------- TROPOSPHERE -----------------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T0,~,~]=parmCalc(0);                                          %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    a=solve(v==T0+lambda*z);                                              %m
    
%-------------------- LOW STRATOSPHERE ------------------------------------
    %In the low stratosphere, the T is constant at about 216.65K, so the
    %altitude cannot be calculated whith this T value.
    
%-------------------- HIGH STRATOSPHERE -----------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T0,~,~]=parmCalc(25000);                                      %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    c=solve(v==T0+lambda*(z-25000));                                      %m
    
%-------------------- FINAL CHECK -----------------------------------------
    a=realNum(a);                                                         %m
    c=realNum(c);                                                         %m
    
    if v==216.65                                                          %K
        disp('This temperature corresponds to that between 11000m and 25000m, where it is constant');
    elseif a<11000&&a>=0                                                  %m
        d(1)=a;                                                           %m
    else
        disp('Error. No altitude matches the specified conditions.');
    end
    if c<47000&&c>25000                                                   %m
        d(2)=c;                                                           %m
    end

%-------------------- PRESSURE --------------------------------------------
elseif strcmp(n,'P')
%-------------------- TROPOSPHERE -----------------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T0,P0,~]=parmCalc(0);                                         %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    a=solve(v==P0*(1+lambda*z/T0).^(-g*M/(R*lambda)));                    %m
    
%-------------------- LOW STRATOSPHERE ------------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [~,T0,P0,~]=parmCalc(11000);                                          %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    b=solve(v==P0*exp(-g*M*(z-11000)/(R*T0)));                            %m
    
%-------------------- HIGH STRATOSPHERE -----------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T0,P0,~]=parmCalc(25000);                                     %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    c=solve(v==P0*(1+lambda*(z-25000)/T0).^(-g*M/(R*lambda)));            %m
    
%-------------------- FINAL CHECK -----------------------------------------
    a=realNum(a);                                                         %m
    b=realNum(b);                                                         %m
    c=realNum(c);                                                         %m
    
    if a<11000&&a>=0                                                      %m
        d=a;                                                              %m
    elseif b<25000&&b>=11000                                              %m
        d=b;                                                              %m
    elseif c<47000&&c>=25000                                              %m
        d=c;                                                              %m
    else
        disp('Error. No altitude matches the specified conditions.');
    end
    
%-------------------- DENSITY ---------------------------------------------
elseif strcmp(n,'rho')
%-------------------- TROPOSPHERE -----------------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T0,~,rho0]=parmCalc(0);                                       %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    a=solve(v==rho0*(1+lambda*z/T0).^(-g*M/(R*lambda)-1));                %m
    
%-------------------- LOW STRATOSPHERE ------------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [~,T0,~,rho0]=parmCalc(11000);                                        %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    b=solve(v==rho0*exp(-g*M*(z-11000)/(R*T0)));                          %m
    
%-------------------- HIGH STRATOSPHERE -----------------------------------
    %---------------- CONSTANTS -------------------------------------------
    [lambda,T0,~,rho0]=parmCalc(25000);                                   %[K/m,K,Pa,kg/m^3]
    %---------------- CALCULATIONS ----------------------------------------
    c=solve(v==rho0*(1+lambda*(z-25000)/T0).^(-g*M/(R*lambda)-1));        %m
    
%-------------------- FINAL CHECK -----------------------------------------
    a=realNum(a);                                                         %m
    b=realNum(b);                                                         %m
    c=realNum(c);                                                         %m
    
    if a<11000&&a>=0                                                      %m
        d=a;                                                              %m
    elseif b<25000&&b>=11000                                              %m
        d=b;                                                              %m
    elseif c<47000&&c>=25000                                              %m
        d=c;                                                              %m
    else
        disp('Error. No altitude matches the specified conditions.');
    end
else
    disp('Incorrect parameter. Check the function code for more information.');
end
end