function w = ex2no3(n, d)
    % Get sample data
    xval = linspace(-2.0, 2.0, n);
    a = 1;
    m = 2;
    
    yval = a * xval.^m;
    
    % Get A matrix
    A = fliplr(vander(xval));
    A = A(:, 1:d);
    
    % Get weight of least squares approximation
    w = inv(A' * A) * (A' * yval');
    
    % Get test data
    xtest = linspace(-3.0, 3.0, n);
    
    % Get A matrix of test data
    A_test = fliplr(vander(xtest));
    A_test = A_test(:, 1:d);
    
    % Multiply with the weight of the approximation 
    % to get the prediction
    ytest = A_test * w;
    
    plot(xtest, ytest)
end