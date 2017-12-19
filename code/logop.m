function [ OUT ] = logop( IN, sigma, kernel )
%6 Implement the LoG operator as a parametric function of the variance
%   Input:
%       IN: input matrix
%       sigma: variance of Gaussian filter
%       kernel: kernel size
%   Output:
%       OUT: output matrix

[h,w] = size(IN);

if nargin == 2
    kernel = 1; % default
    % else
    % 	strTitle = strcat(strTitle, ',  kernel=', num2str(kernel));
end

if sigma ~= 0
    IN = imgaussfilt(IN,sigma);
end

LAP =  [-1 -1 -1;
    -1  8 -1;
    -1 -1 -1];
IN_filtered = imfilter(IN, LAP);

m = max(max(IN_filtered(2:(h-1),2:(w-1))));
OUT = round(IN_filtered/m)*255;
% OUT = IN_filtered;

figure, imshow(uint8(OUT));

end

