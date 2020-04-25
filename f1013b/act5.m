clear all;

[X,Y] = meshgrid(-2:0.2:2, -2:0.2:2);
Z = X.*exp(-X^2 - Y.^2);
[C, h] = contour(X,Y,Z);