function [ OUT ] = BUPT_log( IN, sigma, kernel )
%6 Implement the LoG operator as a parametric function of the variance
%   Input:
%       IN: input matrix
%       sigma: variance of Gaussian filter
%   Output:
%       kernel: kernel size

% [I,w,h,level]= BUPT_pgmreader(path);
% img = uint8(zeros(w,h));

lapT=[-1 -1 -1;
    -1 8 -1;
    -1 -1 -1];

if nargin == 2
    kernel = 1; % default
end

p2=[kernel, kernel];
siz = (p2-1)/2;
std2 = sigma^2;
[x, y] = meshgrid(-siz(2):siz(2),-siz(1):siz(1));
arg   = -(x.*x + y.*y)/(2*std2);
T     = exp(arg);
T(T<eps*max(T(:))) = 0;
sumh = sum(T(:));
if sumh ~= 0,
    T  = T/sumh;

display(T);
OUT=imfilter(IN,T);
OUT=imfilter(OUT,lapT);

figure, imshow(uint8(OUT));
title(strcat('sigma=',num2str(sigma),', kernel=',num2str(kernel)));

end

