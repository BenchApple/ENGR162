% Activity HW08: An MATLAB Activity.
% File: HW8_Prob2_chappeb.m
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
% Solves problem 2 of the programming for hw8

% Create the 31 steps needed for the x, y coordinate system
x = linspace(-3, 3, 31);
y = linspace(-3, 3, 31);

% Create the meshgrid
[X, Y] = meshgrid(x, y);

% Define the constants we will be using
q = 3 * power(10, -6);
d = 1;
k = 8.9875 * power(10, 9);

% Define the function that the potential lines will be drawn for
phi = k * q * ((1 ./(sqrt(X.^2 + Y.^2))) + (1 ./ (sqrt((X + d).^2 + Y.^2))) - (1 ./ (sqrt(X.^2 + (Y - d).^2))));

% Map the contours for this function
contour(X, Y, phi, 20);

% Define the X and Y components of the vector field
Xcomp = ((k * q * X) ./ (power((X.^2 + Y.^2), 3/2))) + ...
        ((k * q * (X + d)) ./ (power(((d + X).^2 + Y.^2), 3/2))) - ...
        ((k * q * X) ./ (power((X.^2 + (Y - d).^2), 3/2)));
Ycomp = ((k * q * Y) ./ (power((X.^2 + Y.^2), 3/2))) + ...
        ((k * q * Y) ./ (power(((d + X).^2 + Y.^2), 3/2))) - ...
        ((k * q * (Y - d)) ./ (power((X.^2 + (Y - d).^2), 3/2)));
    
% Define the X and Y to be used for lines
xlines = linspace(-3, 3, 21);
ylines = linspace(-3, 3, 21);

[Xlines, Ylines] = meshgrid(xlines, ylines);

% Draw the charge locations
hold on;
xLocs = [0,-d];
yLocs = [0, 0];
scatter(xLocs, yLocs, 'filled', 'MarkerEdgeColor', 'blue', 'MarkerFaceColor', 'blue');
scatter(0, d, 'filled', 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red');


% Map the vector flow lines
streamline(X, Y, Xcomp, Ycomp, Xlines, Ylines);

% Set the title n stuff
title("Equipotential Lines and Vector Field Flow for Static Charges");

legend("Equipotential Lines", "Positive Charge Locations", "Negative Charge Location", "Vector Field Flow");
%legend(c1, "Charge 1 Location (+)",c2, "Charge 2 Location (+)", c3, "Charge 3 Location (-)");
%legend;
xlabel("X Axis Location (m)");
ylabel("Y Axis Location (m)");




