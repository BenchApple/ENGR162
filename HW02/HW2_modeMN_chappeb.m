% Activity HW 2 Prob 1: An MATLAB Activity.
% File: HW2_modeMN_chappeb.m
% Date: 31 January 2021
% By: Ben Chappell
% chappeb
% Section: 5
% Team: 70
% 
% ELECTRONIC SIGNATURE
% Ben Chappell
% 
% The electronic signature above indicates that the program
% submitted for evaluation is my individual work. I have
% a general understanding of all aspects of its development
% and execution.
% 
% Calculates the maximum downward deflection of a rectangular plate
% carying a uniform load over the entire surface

function [sum] = HW2_modeMN_chappeb(a, b, m, n)
% Calculates the maximum downward deflection of a rectangular plate carrying
% a uniform load over its entire surface, given the side lengths and both
% mode numbers
    
    firstHalf = sin((m * pi) / 2) * sin((n * pi) / 2) / (m * n);
    secondHalf = 1 / ((((m*m) / (a*a)) + ((n*n) / (b*b)))^2);
    sum = (firstHalf * secondHalf);
end

