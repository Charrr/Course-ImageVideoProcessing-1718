function [ OUT ] = BUPT_noise(IN, noiseModel, sigma)
% Title: ex4a
% Description: This function adds different types of noise and caculates the valuse of MSE and PSNR
% Input type 1 for Gaussian, 2 for salt and pepper, if the type is 2, the value is not needed

%4a Equalises grey-scale images based on their histogram
%   Input:
%       IN: input greyscale matrix
%       noiseModel:  1 for Gaussian, 2 for salt and pepper
%       sigma: parameter for Gaussian noise
%   Output:
%       OUT: output greyscale matrix


% add noise
[h, w] = size(IN);

if noiseModel == 1
    noiseI=imnoise(IN,'gaussian',0,sigma);
elseif noiseModel == 2
    noiseI=imnoise(IN,'salt & pepper');
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