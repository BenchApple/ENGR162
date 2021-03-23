% Activity HW08: An MATLAB Activity.
% File: HW8_Prob1_chappeb.m
% Date: 3/22/21
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
% Performs Cotters method on input data.

% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
n = input("Please enter the number of factors being analyzed: ");
trial_outputs = input("Please enter the trial outputs in an array: \n");

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
% Check to see if the trial is of the appropriate size.
if(size(trial_outputs, 2) ~= (2 * n + 2))
   disp("Error: Not enough trial outputs for factors being analyzed.");
else
    % Get all of the outputs and their significance levels.
    cotters = zeros(n, 4);
    
    for j = 1:n
        % Get the odd contrast for the jth factor
        cotters(j, 1) = (1/4) * ((trial_outputs((2 * n) + 2) - trial_outputs(j + n + 1)) + ...
                               (trial_outputs(j + 1) - trial_outputs(1)));
        % Calculate the even contrast for the jth factor
        cotters(j, 2) = (1/4) * ((trial_outputs((2 * n) + 2) - trial_outputs(j + n + 1)) - ...
                               (trial_outputs(j + 1) - trial_outputs(1)));
                           
        % Calculate the effect measure for the jth factor
        cotters(j, 3) = abs(cotters(j, 1)) + abs(cotters(j, 2));
    end
    
    m_total = sum(cotters(:, 3));
    
    for j = 1:n
       % Calculate the sensitivity factor
       cotters(j, 4) = cotters(j, 3) / m_total;
    end


% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
    fprintf("\nOutput Table for Cotter's Method:\n\nFactor #   Odd Contrast   Even Contrast   Effect Measure   Sensitivity\n");
    for j = 1:n
       fprintf("%8.0d %14.3f %15.3f %16.3f %13.3f\n", j, cotters(j, 1), cotters(j, 2), cotters(j, 3), cotters(j, 4));
    end
    
    fprintf("\n")
    for j = 1:n
        if(cotters(j,4) > (1/n))
           fprintf("Factor %d has significant sensitivity\n", j); 
        else
           fprintf("Factor %d does not have significant sensitivity\n", j); 
        end
    end
end
