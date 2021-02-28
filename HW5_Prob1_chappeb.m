% Activity X.X.X: An MATLAB Activity.
% File: HW5_Prob1_chappeb.m
% Date: 1/26/20
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
% A BRIEF DESCRIPTION OF WHAT THE PROGRAM OR FUNCTION DOES

% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
userInput = input("Please enter the file name for the image: ", 's');
userData = importdata(userInput);
finalData = userData.data;

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------

% Initialize our bounds.
aMin = -10;
aMax = 10;
aStep = 0.1;
oneOverAStep = int32(1 / aStep);

pointResiduals = zeros((aMax - aMin) / aStep, (aMax - aMin) / aStep, size(finalData, 1));
locations = zeros((aMax - aMin) / aStep, (aMax - aMin) / aStep, 2);
%a0 = aMin:aStep:

for a0 = aMin:aStep:aMax
   for a1 = aMin:aStep:aMax
       pointResiduals((a0 * oneOverAStep) - (aMin * oneOverAStep) + 1, (a1 * oneOverAStep) - (aMin * oneOverAStep) + 1, :) = ...
                     finalData(:,2) - a0 - (a1 * finalData(:,1));
       locations((a0 * oneOverAStep) - (aMin * oneOverAStep) + 1, (a1 * oneOverAStep) - (aMin * oneOverAStep) + 1, :) = ...
                     [a0, a1];
   end
end
methodOneResiduals = sum((pointResiduals.^2) .* log(1 + abs(pointResiduals)), 3);
[methodOneMinCols, methodOneMinLocCol] = min(methodOneResiduals);
[methodOneMin, methodOneMinLocRow] = min(methodOneMinCols);
methodOneMinLoc = ([methodOneMinLocCol(methodOneMinLocRow), methodOneMinLocRow]);
methodOneMinLoc = locations(methodOneMinLoc)

methodTwoResiduals = sum(abs(pointResiduals), 3);
[methodTwoMinCols, methodTwoMinLocCol] = min(methodTwoResiduals);
[methodTwoMin, methodTwoMinLocRow] = min(methodTwoMinCols);
methodTwoMinLoc = ([methodTwoMinLocCol(methodTwoMinLocRow), methodTwoMinLocRow]);
methodTwoMinLoc = locations(methodTwoMinLoc)

methodThreeResiduals = sum(pointResiduals.^2, 3);
[methodThreeMinCols, methodThreeMinLocCol] = min(methodThreeResiduals);
[methodThreeMin, methodThreeMinLocRow] = min(methodThreeMinCols);
methodThreeMinLoc = [methodThreeMinLocCol(methodThreeMinLocRow), methodThreeMinLocRow];
methodThreeMinLoc = locations(methodThreeMinLoc)



% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
fprintf("For R1, the best-fit coefficients for a linear model are: \na0: %.1f  a1: %.1f\n", methodOneMinLoc(1), methodOneMinLoc(2));
fprintf("For R2, the best-fit coefficients for a linear model are: \na0: %.1f  a1: %.1f\n", methodTwoMinLoc(1), methodTwoMinLoc(2));
fprintf("For R3, the best-fit coefficients for a linear model are: \na0: %.1f  a1: %.1f\n", methodThreeMinLoc(1), methodThreeMinLoc(2));






