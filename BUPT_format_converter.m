function [ OUT ] = BUPT_format_converter( IN, arg )
%1b Transforms images between RGB and YUV colour models.
%   Input Parameters:
%           IN: 3-dimensional RGB/YUV data matrix
%           arg: set as 'inverse' to perform a YUV-to-RGB transform
%   Output Parameters:
%           OUT: 3-dimensional YUV/RGB data matrix

if nargin == 1      % id arg not specified
    
    R = IN(:,:,1);
    G = IN(:,:,2);
    B = IN(:,:,3);
    
    Y = round( 0.257*R + 0.504*G + 0.098*B + 16 );
    U = round( -0.148*R - 0.291*G + 0.439*B + 128 );
    V = round( 0.439*R - 0.368*G - 0.071*B + 128 );
    
    OUT = cat(3,Y,U,V);
    
else if strcmp(arg, 'inverse')  % if arg specified to be the inverse transform
        
        Y = IN(:,:,1);
        U = IN(:,:,2);
        V = IN(:,:,3);
        
        R = round( 1.1641*Y - 0.0018*U + 1.5958*V - 222.6580 );
        G = round( 1.1641*Y - 0.3914*U - 0.8135*V + 135.6041 );
        B = round( 1.1641*Y + 2.0178*U - 0.0012*V - 276.7485 );
        
        OUT = cat(3,R,G,B);
        
    else
        error('To use the inverse conversion, name the second argument ''inverse''.');
        
    end
    
    imshow(uint8(OUT));
    
end

