% Activity HW 2 Prob 1: An MATLAB Activity.
% File: HW2_Prob1_chappeb.m
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

% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
inputError = false;

a = double(input("Enter the length a [meters]: "));
b = double(input("Enter the length b [meters]: "));
K = double(input("Enter the parameter K [meters^3]: "));
mMax = double(input("Enter M_max: "));
nMax = double(input("Enter N_max: "));

if (a <= 0)
    fprintf("Input value for a must be strictly greater than 0");
    inputError = true;
end

if (b <= 0)
    fprintf("Input value for b must be strictly greater than 0");
    inputError = true;
end

if (K <= 0)
    fprintf("Input value for K must be strictly greater than 0");
    inputError = true;
end
% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
if (~inputError)
    sum = 0;
    
    for i = 1:mMax
        for j = 1:nMax
            sum = sum + HW2_modeMN_chappeb(a, b, i, j);
            
        end
    end
    
    maxDeflect = sum;
    
    maxDeflect = maxDeflect * ((16 * K) / pi^6);

    % ---------------------------------------------------
    %   Outputs
    % ---------------------------------------------------
    fprintf("\nThe maximum deflection of the plate is %.4f meters\n", maxDeflect);
end

