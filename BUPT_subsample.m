function [ out ] = BUPT_subsample( in, x, y )
%1c Subsamples the image by x horizontal and y vertical pixels
%   Input:
%       in: input RGB matrix
%       x: horizontal sampling rate
%       y: vertical sampling rate
%   Output:
%       out: output sampled RGB matrix

[w, h] = size(in);  % width and height of the input matrix
a = ceil(w/x);      % a samples every row
b = ceil(h/y);      % b samples every column
M = zeros(a, b);    % initialise the sampled matrix

for i = 1:a
    for j = 1:b
        M(i,j) = in( 1+x*(i-1), 1+y*(j-1) );    % subsampling
    end
end

out = kron(M, ones(x,y));   % interpolate
out = out(1:w, 1:h);        % truncate the image into its original size

end
