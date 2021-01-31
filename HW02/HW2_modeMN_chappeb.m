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

function [maxDeflect] = HW2_modeMN_chappeb(a, b, m, n)
% Calculates the maximum downward deflection of a rectangular plate carrying
% a uniform load over its entire surface, given the side lengths and both
% mode numbers
    sum = 0;
    
    for i = 1:m
        for j = 1:n
            firstHalf = sin((i * pi) / 2) * sin((j * pi) / 2) / (i * j);
            secondHalf = 1 / ((((i*i) / (a*a)) + ((j*j) / (b*b)))^2);
            sum = sum + (firstHalf * secondHalf);
            
        end
    end
    
    maxDeflect = sum;
end

