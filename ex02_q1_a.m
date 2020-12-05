% Assignment 2, Q 2.1 a) By iterating this process, a sequence of polygons P(t)
% could be created. Show the evolution of the
% initial polygon throughout the iterations. In particular your code should be able to initialize an
% arbitrary polygon of about 20 or more vertices and perform some 100 to 500 iterations. (the initial
% coordinates could be arbitrary, but should be reasonable for plotting purposes)
close all;
clear all;

% Get cos theta and sin theta values so we can chose co ordinates on circle
% based on angle
theta = linspace(0,2*pi,361);
c = cos(theta);
s = sin(theta);
% -------------------------ENTER SIDES-------------------------------------
% Here chose the number of sides of polygon 
sides = 5;

% Get x and y coordinates by diving 2 pi into number of sides
stride = 360/sides;
x = c(1:stride:361);
y = s(1:stride:361);

% -----------------------ENTER ITERATIONS-------------------------------------
iter = 10;

% Iterate
for t = 1:iter+1
   % Using hold on to plot in same plot
   hold on
   plot(x, y)
   % Now for number of sides calculate middle points
   for i=(1:sides)
       % Midpoints
       x(i) = (x(i) + x(i+1))/2;
       y(i) = (y(i) + y(i+1))/2;
   end
   % The last vertex needs to be set to initial vertex to close the polygon
   x(sides+1) = x(1);
   y(sides+1) = y(1);
   % Adding 0.2 sec pause for visualization
   pause(0.2)
   %axis([-1.2 1.2 -1.2 1.2])
   %axis equal
end
hold off