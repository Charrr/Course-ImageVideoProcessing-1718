function [ OUT ] = BUPT_up( IN, interpolate, factor )
%4b Increases the resolution of images by a given factor
%   Input:
%       IN: input matrix
%       interpolate:  'n' for nearest neighbour, 'b' for bilinear
%       factor: up-sampling factor
%   Output:
%       OUT: output matrix


subplot(1,2,1), imshow(uint8(IN));title('Original image');

if strcmp(interpolate, 'n') || strcmp(interpolate, 'nearest')
    OUT = imresize(IN, factor, 'nearest');
    subplot(1,2,2), imshow(uint8(OUT)); title('Nearest Neighbour');
elseif strcmp(interpolate, 'b') || strcmp(interpolate, 'bilinear')
    OUT = imresize(IN, factor, 'bilinear');
    subplot(1,2,2), imshow(uint8(OUT)); title('Bilinear');
elseif strcmp(interpolate, 'both')
    subplot(1,3,1), imshow(uint8(IN)); title('Original image');
    OUT{1} = imresize(IN, factor, 'nearest');
    OUT{2} = imresize(IN, factor, 'bilinear');
    subplot(1,3,2), imshow(uint8(OUT{1})); title('Nearest Neighbour');
    subplot(1,3,3), imshow(uint8(OUT{2})); title('Bilinear');
else
    error('Please input ''n'' or ''b'' for the second parameter');
end

% subplot(1,2,2), imshow(uint8(OUT));title('Up-sampled image');

end