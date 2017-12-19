function [ OUT ] = BUPT_lowpass( IN, power, sigma )
%5a Convolves an image with a Gaussian kernel.
%   Input:
%       IN: input matrix
%       power: power of the Gaussian noise
%       sigma: parameter of the filter
%   Output:
%       OUT: output matrix

IN = uint8(IN);

figure,
subplot(1,3,1), imshow(IN); title('Original image');

IN_noise = imnoise(IN,'gaussian', 0, 0.05);
subplot(1,3,2), imshow(IN_noise); title('With noise');

if length(power)==2
    size = (power-1)/2;
else
    size = [(power-1)/2 (power-1)/2];
end

std2 = sigma^2;
[x, y] = meshgrid(-size(2):size(2),-size(1):size(1));
arg   = -(x.*x + y.*y)/(2*std2);
T     = exp(arg);
T(T<eps*max(T(:))) = 0;
sumh = sum(T(:));

if sumh ~= 0,
    T  = T/sumh;
end

OUT = imfilter(IN_noise,T,'symmetric');
subplot(1,3,3), imshow(uint8(OUT)); title(strcat('Filtered with lowpass, sigma=', num2str(sigma)));

end

