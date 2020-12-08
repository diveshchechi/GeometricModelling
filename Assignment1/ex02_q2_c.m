function w = ex2no2c(n)
    % Get sample data
    xval = linspace(-2.0, 2.0, n);
    a = 1;
    m = 2;
    
    yval = a * xval.^m;
    % Vandermode - Power?
    w = linsolve(vander(xval), transpose(yval));
    xtest = linspace(-3.0, 3.0, n);
    ytest = vander(xtest) * w;
    plot(xtest, ytest)
end
