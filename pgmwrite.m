function pgmwrite(I,l,mode)
%PGMWRITE Writes a data matrix into a pgm file.
% Input Parameters:
%                I: 2-dimensional data matrix (w*h)
%                l: grey levels
%             mode: ASCII or Binary (1 for Ascii and 0 for Binary)

[w,h] = size(I);    % size of the image is the dimension of the matrix

% open the file in read mode
if (mode == 1) ; % Ascii mode
    f = fopen('outascii.pgm','w');
    fprintf(f,'P2\n');
    fprintf(f,'#Image created by Ziqian Chen\n');   % Signature.
    fprintf(f,'\n# image width\n');
    fprintf(f,'%i',w);
    fprintf(f,'\n# image height\n');
    fprintf(f,'%i',h);
    fprintf(f,'\n# greyscale depth\n');
    fprintf(f,'%i',l);
    fprintf(f,'\n');
    
    for i=1:w
        for j=1:h
            fprintf(f,' %s ',num2str(I(i,j)));
            fprintf(f,'\n');
        end
    end
    
else            % Binary mode
    f = fopen('outbinary.pgm','w');
    fprintf(f,'P5\n');
    fprintf(f,'#Image created by Ziqian Chen\n');   % Signature.
    fprintf(f,'\n# image width\n');
    fprintf(f,'%i',w);
    fprintf(f,'\n# image height\n');
    fprintf(f,'%i',h);
    fprintf(f,'\n# greyscale depth\n');
    fprintf(f,'%i',l);
    fprintf(f,'\n');
    
    for i=1:w
        for j=1:h
            fprintf(f,'%c',I(i,j));
        end
    end
    
end