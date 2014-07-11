%% Real Number Selection Function
%This function selects the real numbers of an array of 1 row and returns
%only that real values, eliminating those with imaginary part.
function [n]=realNum(m)
m=double(m);
n=m(m==real(m));
end