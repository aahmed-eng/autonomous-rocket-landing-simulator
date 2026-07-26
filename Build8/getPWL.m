function y = getPWL(lines,x)
% Evaluate a piecewise linear function where line 1 (y=m1x+c1) is followed before split point s,
% and line 2 (y=m2x+c2) is followed after s. 

% Inputs:
% lines.split  The split point (point where both lines meet).
% lines.gradients   A vector [m1 m2] containing the gradients of line 1 and line 2
% lines.intercepts  A vector [c1 c2] contianing the intercepts of line 1 and line 2

% Unbundle the variables needed
s = lines.split;              % The split point where both lines meet

% The line gradients [m1 m2] and line intercepts [c1 c2]
% such that y=m1*x + c1 when x <= s and y=m2*x + c2 when when x > s
grads = lines.gradients; 
inters = lines.intercepts;  

% The size of x
n = length(x);

% A vector to hold the output
y = zeros(1,n);

%for each of the numbers in x
for k = 1:n
    
    if x(k) <= s   % Less than s, use line1 else use line2
        y(k) = grads(1)*x(k) + inters(1);     
    else                          
        y(k) = grads(2)*x(k) + inters(2);     
    end                                
end