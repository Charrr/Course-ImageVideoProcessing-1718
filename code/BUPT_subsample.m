function [ OUT ] = BUPT_subsample( IN, x, y )
%1c Subsamples the image by x horizontal and y vertical pixels
%   Input:
%       IN: input RGB matrix
%       x: horizontal sampling rate
%       y: vertical sampling rate
%   Output:
%       OUT: output sampled RGB matrix

[w, h] = size(IN);  % width and height of the input matrix
a = ceil(w/x);      % a samples every row
b = ceil(h/y);      % b samples every column
M = zeros(a, b);    % initialise the sampled matrix

for i = 1:a
    for j = 1:b
        M(i,j) = IN( 1+x*(i-1), 1+y*(j-1) );    % subsampling
    end
end

OUT = kron(M, ones(x,y));   % interpolate
OUT = OUT(1:w, 1:h);        % truncate the image into its original size

figure, imshow(uint8(OUT)); title(strcat('Subsampled',num2str(x),'by',num2str(y)));

end

