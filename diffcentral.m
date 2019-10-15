function dx = diffcentral(x)
% First central differentiation for each column if X is a matrix.
% dx = diffcentral(x)
% Use this function recursevely to get higher differentiations: deriv(deriv(x)).
% Divide by the time interval (for example) to get the derivative.
% Smooth the data to remove noise due to the differentiation process.

% Marcos Duarte 27Sep2003 mduarte@usp.b
dx = [x(2,:)-x(1,:); [diff(x(1:end-1,:)) + diff(x(2:end,:))]/2; x(end,:)-x(end-1,:)];