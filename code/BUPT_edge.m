function [ OUT ] = BUPT_edge( IN, oper )
%5b Detects edges by Sobel/Roberts/Prewitt operator.
%   Input:
%       IN: input matrix
%       oper: 's' for Sobel, 'p' for Prewitt, 'r' for Roberts
%   Output:
%       OUT: output matrix

if strcmp(oper,'s')
    strOper = ' Sobel';
    Tx=[ 1 0 -1; 2 0 -2; 1 0 -1]; %Define the all types module
    Ty=[ -1 -2 -1; 0 0 0; 1 2 1];
elseif strcmp(oper,'r')
    strOper = ' Roberts';
    Tx=[ 0 0 -1; 0 1 0; 0 0 0];
    Ty=[ -1 0 0; 0 1 0; 0 0 0];
elseif strcmp(oper,'p')
    strOper = ' Prewitt';
    Tx=[ 1 0 -1; 1 0 -1; 1 0 -1];
    Ty=[ -1 -1 -1; 0 0 0; 1 1 1];
else
    error('Please input ''s'', ''r'' or ''p'' for the second parameter');
end

hx = double(imfilter(IN,Tx,'replicate'));
hy = double(imfilter(IN,Ty,'replicate'));
h = ((hx.*hx)+(hy.*hy)).^0.5;
OUT = uint8(h);

imshow(uint8(OUT)); title(strcat('Edge detection with', strOper));

end

