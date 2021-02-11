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
% NOTE: This code and the K-means concepts that go along with it
% are taken from work previously done by me, Ben Chappell

% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
imgname = input("Please enter the file name for the image: ", 's');

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
% Get the original picutre and the grayscale version.
picOrig = imread(imgname);
imshow(picOrig);
grayscale = rgb2gray(picOrig);
figure
imshow(grayscale);
% Reshape the grayscale to make it more amenable to what we need.
G = reshape(grayscale, size(grayscale, 1) * size(grayscale, 2), 1);
A = double(picOrig);

% Normalize the data to be between 0 and 1
A = A / 255;
imgSize = size(A);

% Reshape the image into an Nx3 image where N is the number of pixels
% Each row will contain the red, gree, and blue pixel values
X = reshape(A, imgSize(1) * imgSize(2), 3);

% Run K-Means on this data, using K = 2 (since we want a mask and no mask
% section.
K = 2;
max_iters = 30;

% Initialize the centroids to be the max and min grayscale values
% respectively
[M, I]




% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------