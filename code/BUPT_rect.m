function [ OUT ] = BUPT_rect( IN, sizeRect )
%5a Convolves an image with a rectangular kernel.
%   Input:
%       IN: input matrix
%       sizeRect: size of the rectangular filter, [w,h]
%       sigma: up-sampling factor
%   Output:
%       OUT: output matrix

IN = uint8(IN);

figure,
subplot(1,3,1), imshow(IN); title('Original image');

IN_noise = imnoise(IN,'gaussian', 0, 0.05);
subplot(1,3,2), imshow(IN_noise); title('With noise');

T = ones(sizeRect(1),sizeRect(2));
T = T/(sum(T(:)));
% disp(T);

OUT = imfilter(IN_noise,T,'symmetric');
subplot(1,3,3), imshow(uint8(OUT));
title(strcat('Filtered with rectanglar ', num2str(sizeRect(1)), 'by',num2str(sizeRect(2))));

end