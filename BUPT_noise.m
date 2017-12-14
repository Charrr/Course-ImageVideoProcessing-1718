function [ OUT ] = BUPT_noise(IN, noiseModel, sigma)
%4a Equalises grey-scale images based on their histogram
%   Input:
%       IN: input matrix
%       noiseModel:  'g' for Gaussian, 's' for salt and pepper
%       sigma: parameter for Gaussian noise
%   Output:
%       OUT: output matrix


% add noise
[h, w] = size(IN);

if strcmp(noiseModel, 'g') || strcmp(noiseModel, 'gaussian')
    noiseI=imnoise(IN,'gaussian',0,sigma);
elseif strcmp(noiseModel, 's') || strcmp(noiseModel, 'salt')
    noiseI=imnoise(IN,'salt & pepper');
else
    error('Please input ''g'' or ''s'' for the second parameter');
end

OUT = noiseI;

% Caculate the values of MSE and PSNR
Z = noiseI-IN;
Z = Z.*Z;

colorType = ndims(IN);  % number of dimention
if colorType == 2 % for greyscale
    MSE=sum(sum(Z))/(w*h);
    PSNR=20*log10(255/(MSE^0.5));
elseif colorType == 3 % for RGB
    MSE=sum(sum(sum(Z))/(w*h*3));
    PSNR=20*log10(255/(MSE^0.5));
end

figure, imshow(OUT);
title(strcat('MSE=',num2str(MSE),'      PSNR=',num2str(PSNR)));
end