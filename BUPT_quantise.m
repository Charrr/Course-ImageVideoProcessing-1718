function [ OUT ] = BUPT_quantise( IN, q )
%2a Quantises a greyscale image by factor q
%   Input:
%       in: input RGB matrix
%       l: greyscale level of the input image
%       q: quantisation factor (dyadic)
%   Output:
%       out: output RGB matrix

OUT = round(IN/q/2)*q*2;

end

