function w = ex2no2b(n)
    % Get sample data
    xval = linspace(-2.0, 2.0, n);
    a = 1;
    m = 2;
    
    yval = a * xval.^m;
    
    % Get sample test [-3, 3]
    xtest = linspace(-3.0, 3.0, n);
    ytest = zeros(1, length(xtest));
    % Lagrangian
    for i=(1:1:n)
        % Get li(x_i) -- named as tmp variable
        tmp = ones(1, length(xtest));
        for j=(1:1:n)
            if i ~= j
                tmp = tmp .* (xtest   - xval(j));
                tmp = tmp ./ (xval(i) - xval(j));
            end
        end
        % p(x) = SUM_i y(x_i) * li(x_i)
        ytest = ytest + tmp * yval(i);
    end
    plot(xtest, ytest)
end