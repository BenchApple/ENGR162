% Activity HW3
% File: HW3_Prob1_chappeb.m
% Date: 11 Feb 2021
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
% Completes Problem 1 for the HW3 programming assignments.


% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
imgname = input("Please enter the file name for the image: ", 's');

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
% Get the original picutre and the grayscale version.
picOrig = imread(imgname);
g = rgb2gray(picOrig);

% Pre allocate mask and set all mask values to 0 (black)
phi = zeros(size(g));

% Setting the right threshold is going to easily be the hardest part of
% this.
% Set the grayscale image to modulos of the individual values (of 5) and
% find the most common element. Then set the masking value to be one modulo
% below that value.
modValue = 5;
gMod = g - mod(g, modValue);
m = mode(gMod, 'all');
modValScalar = 3;
mid = m - (modValScalar * modValue);


% Set the middlemost value to be our initial threshold
maxim = max(max(g));
minim = min(min(g));
adjustment = 20; % Stores the desired adjustment to the masking filter.
avg = (maxim - minim) / 2 + minim + adjustment; 

%If the average is rly low (aka the ball is the majority of the pixels),
% adjust the mid accordingly
if (mid < 60)
    mid = (mid + avg) / 2;
end

% Conditionally set the mask to false.
phi(g < mid) = 1;

% Fill in any holes in the mask
phi = imfill(phi, 'holes');

% Try the strel structure thing
% Maybe calculate the radius of the disk by the number of unmasked pixels
% as of right now.
totalUnmasked = sum(sum(phi))
radius = 10;
se = strel('disk', radius);
phi = imopen(phi, se);

figure
imshow(phi);




