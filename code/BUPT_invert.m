function [ OUT ] = BUPT_invert( IN, l )
%3a Inverts the colour of the image.
%   Input:
%       IN: input RGB/greyscale matrix
%       l:  colour level of the image (default as 255)
%   Output:
%       OUT: output RGB/greyscale matrix

if nargin == 1
    l = 255;    % if l not specified
end

OUT = l - IN;

figure, imshow(uint8(OUT)); title('Negative inversion');

end

