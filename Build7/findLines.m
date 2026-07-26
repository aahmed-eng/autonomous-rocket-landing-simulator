function lineCoeffs = findLines(x,y)
% Find all the line coefficients needed to describe a Piecewise Linear Function 
% through 3 points. Outputs gradients and intercepts of the lines in form of a structure. 

% Example usage: lineCoeffs = findLines([1 2 3],[7 5 2])

% INPUTS x and y are vectors containing the coordinates of the 3 points
% x = [x1 x2 x3] and y = [y1 y2 y3]
% where points are (x1,y1), (x2,y2) and (x3,y3)

% OUTPUT is a structure:
% lineCoeffs.split  The split point (point where both lines meet).
% lineCoeffs.gradients   A vector [m1 m2] containing the gradients of line 1 and line 2
% lineCoeffs.intercepts  A vector [c1 c2] contianing the intercepts of line 1 and line 2

% Set the split between the two sections
s = x(2);

% Find the slope and intercept of each section

% The coordinates of the two ends of the 1st section
xs = [x(1) x(2)];
ys = [y(1) y(2)];

% Find the slope and the intercept of a line through the two points
[m1, c1] = points2line(xs,ys);

% The coordinates of the two ends of the 2nd section
xs = [x(2) x(3)];
ys = [y(2) y(3)];

% Find the slope and the intercept of a line through the two points
[m2, c2] = points2line(xs,ys);

% Store in structure for easy output
lineCoeffs.split = s;
lineCoeffs.gradients = [m1 m2];  
lineCoeffs.intercepts = [c1 c2];


function [m,c] = points2line(x,y)
% [m,c] = line2line(x,y) finds a straight line through two points
% x is a vector of the x coordinates 
% y is a vector of the y coordinates 
% m is the slope of the line
% c is the intercept of the line

% Form the matrix to solve
% mx1 + c = y1     
% mx2 + c = y2
A = [ x(1) 1 ; x(2) 1];
Y = [ y(1) ; y(2)];

%Solve the problem
C = A\Y;      %where C = [m ; c]

% The top element is the slope
m = C(1);

%The bottom element is the intercept
c = C(2);
    
