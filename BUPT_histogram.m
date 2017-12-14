function [ H ] = BUPT_histogram( IN, l )
%2b Presents the histogram of a given image.
%   Input:
%       IN: input RGB matrix
%       l:  colour level of the image
%   Output:
%       H: histogram values

[w, h] = size(IN);
H = zeros(1, l+1);  % initialise

for i=1:h
    for j=1:w
        H(IN(i,j)+1) = H(IN(i,j)+1) + 1;  % record the value of the i,j'th pixel
    end
end

% draw the image
figure, bar(0:l, H, 'k'); title('Histogram');

end