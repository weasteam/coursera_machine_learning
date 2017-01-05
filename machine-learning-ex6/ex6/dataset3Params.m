function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%

steps = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
e_best = 100000;

for c = 1:length(steps)
    for s = 1:length(steps)
        model = svmTrain(X,y,steps(c),@(x1, x2) gaussianKernel(x1, x2, steps(s)));
        e = mean(double(svmPredict(model, Xval) ~= yval))
        if (e < e_best)
            e_best = e
            C = steps(c)
            sigma = steps(s)
        end
    end
end




% =========================================================================

end
