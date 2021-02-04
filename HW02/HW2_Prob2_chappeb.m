% Activity HW2: An MATLAB Activity.
% File: HW2_Prob2_chappeb.m
% Date: 1 February 2021
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
% Solves problem two in HW2

% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
inputFile = input("Enter the input file name: ", 's');
outputFile = input("Enter the output file name: ", 's');
windowSize = input("Enter the window size: ");

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
in = fopen(inputFile, 'r');
directData = importdata(inputFile, " ", 1);
data = directData.data;
movingAverage = zeros(size(data, 1) - (windowSize - 1), size(data, 2));
finalJ = (size(data, 1) - windowSize + 1);

for j = 1:finalJ
    movingAverage(j, 1) = data(j + floor(windowSize / 2), 1);
    curSet = [];
    for i = j:(j + windowSize - 1)
       curSet = [curSet data(i, 2)];
    end
    avg = mean(curSet);
    movingAverage(j, 2) = avg;
end

% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
fclose(in);
out = fopen(outputFile, 'w');
fprintf(out, "Time (seconds)  Voltage (Volts)\n");
for line = 1:size(movingAverage, 1)
   fprintf(out, "%14.1f  %15.2f\n", movingAverage(line, 1), movingAverage(line, 2));
end



