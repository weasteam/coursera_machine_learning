function J = CostFunctionJ(X, y, theta)

m = size(X,1);
predictions = X*theta;
sqrErrors = (redictions-y).^2;
J = 1/(2*m)*sum(sqrErrors);
