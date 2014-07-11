#ISA_package

This ISA package contains many functions for calculating many parameters about the **International Stardard Atmosphere (ISA)**.

Equations extracted from Wikipedia and recalculated personally for avoiding errors.

Programmed for **MATLAB** in **MATLAB 2012b**.

##ISA.m

**International Standard Atmosphere (ISA)**  
This function models the **International Standard Atmosphere (ISA)** between 0 and 47000 m from the surface.

###INPUTS
	z --> Altitude (m).

###OUTPUTS
	T --> Temperature (K)  
	P --> Pressure (Pa)  
	rho --> Density (kg/m^3)  

##ISA_P.m

**Pressure Calculation Function for the International Standard Atmosphere (ISA)**  
This function calculates the pressure at a specified altitude.

###INPUTS
	z --> Altitude (m)

###OUTPUTS
	P --> Pressure (Pa)

##ISA_rho.m

**Density Calculation Function for the International Standard Atmosphere (ISA)**  
This function calculates the density at a specified altitude.

###INPUTS
	z --> Altitude (m)

###OUTPUTS
	rho --> Density (kg/m^3)

##ISA_T.m

**Temperature Calculation Function for the International Standard Atmosphere (ISA)**  
This function calculates the temperature at a specified altitude.

###INPUTS
	z --> Altitude (m)

###OUTPUTS
	T --> Temperature (K)

##altitudeCalc.m

**Altitude Calculation Function**  
This function calculates the altitude in which the condition stablished as a parameter is correct.

###INPUTS
	n --> String which can be:
		'T' --> The parameter is a temperature (K).
		'P' --> The parameter is a pressure (Pa).
		'rho' --> The parameter is a density (kg/m^3).
	v --> Value of n in the units specified above (IS).

###OUTPUTS
	d --> Altitude in m that matches the specified condition.

##parmCalc.m
**Parameter function for ISA parameters**  
This function returns the value of the parameters used in the ISA equations as function of altitude.

###INPUTS
	z --> Altitude (m).

###OUTPUTS
	lambda --> Temperature gradient (K/m).
	T --> Reference temperature at a specified altitude (K).
	P --> Reference pressure at a specified altitude (P).
	rho --> Reference density at a specified altitude (kg/m^3).

##realNum.m

**Real Number Selection Function**  
This function selects the real numbers of an array of 1 row and returns only that real values, eliminating those with imaginary part.
