% Create a function which plots y = axm on the interval x ∈ [−3, 3]. Your function needs to allow for
% choosing n randomly or uniformly sampled points on interval [−2, 2]. The location of the chosen
% points need to be marked on the graph (use line markers, see line properties in Matlab). Reasonable
% test values are n = 10, a = 1, and m = 2, 3.

% -------------------------ENTER n & m & a----------------------------------
n = 10;
m = 3;
a = 3;

xval = linspace(-2.0, 2.0, n);
yval = a * xval.^m;
hold on 
% Lets plot by using the ax^m formula directly
plot(xval,yval,'-x')
pause(1)
% Solve the equation AW = B using linsolve or W = inv(A)*B, 
% where A is the vandermonde matrix and W are the weights.
% w = linsolve(vander(xval), yval');
w = inv(vander(xval))*yval' ;
% Now we have the weights.
xtest = linspace(-3.0, 3.0, n);
% Get values of Y by using Y = AW (A is vandermonde matrix and W are weights).
ytest = vander(xtest) * w;
% plot the new interpolated polynomial
plot(xtest, ytest)
