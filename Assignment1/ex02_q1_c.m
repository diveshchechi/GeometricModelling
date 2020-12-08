close all;
clear all;

% Get cos theta and sin theta values so we can chose co ordinates on circle
% based on angle
theta = linspace(0,2*pi,361);
c = cos(theta);
s = sin(theta);
% -------------------------ENTER SIDES-------------------------------------
% Here chose the number of sides of polygon 
sides = 3;

% Get x and y coordinates by diving 2 pi into number of sides
stride = 360/sides;
x = c(1:stride:361);
y = s(1:stride:361);

n = length(x);
% -----------------------ENTER ITERATIONS-------------------------------------
iter = 10;

% Iterate
for t = 1:iter+1
   % Using hold on to plot in same plot
   hold on
   plot(x, y)
   
   % Midpoints
   mat_midpoints = 1/2 * (eye(n) + circshift(eye(n), n-1));
   sp_midpoints = sparse(mat_midpoints);
   
   % Shift
   mat_shift = zeros(n);
   mat_shift(1:n-1, 1:n-1) = eye(n-1) - 1/(n-1);
   sp_shift = sparse(mat_shift);
   
   % Get Sparse Matrix
   sp_tot = (sp_shift * sp_midpoints);
   x = (sp_tot * x')';
   y = (sp_tot * y')';
   
   % The last vertex needs to be set to initial vertex to close the polygon
   x(sides+1) = x(1);
   y(sides+1) = y(1);
   
   % Normalize
   x = x/norm(x(1:sides));
   y = y/norm(y(1:sides));
   
   % Adding 0.2 sec pause for visualization
   pause(0.5)
   %axis([-1.2 1.2 -1.2 1.2])
   %axis equal
end
hold off
