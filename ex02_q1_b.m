% Perform the same operation as above, this time, after each iteration shift X and Y and by their
% respective arithmetic means, then normalize them,  Show a case where the initial polygon
% boundary crosses itself, for example an 8-like shape

close all;
clear all;

% Get cos theta and sin theta values so we can chose co ordinates on circle
% based on angle
theta = linspace(0,2*pi,361);
c = cos(theta);
s = sin(theta);
% -------------------------ENTER SIDES-------------------------------------
% Here chose the number of sides of polygon 
sides = 4;

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
   
   % Shift
   x = x - (sum(x)-x(1))/(length(x)-1);
   y = y - (sum(y)-y(1))/(length(y)-1);

   % Normalize
   x = x/norm(x(1:sides));
   y = y/norm(y(1:sides));
   
   % The last vertex needs to be set to initial vertex to close the polygon
   x(sides+1) = x(1);
   y(sides+1) = y(1);

   % Adding 0.2 sec pause for visualization
   pause(0.5)
   %axis([-1.2 1.2 -1.2 1.2])
   %axis equal
end
hold off