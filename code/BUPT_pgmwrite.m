function BUPT_pgmwrite(M,l,mode,filename)
%PGMWRITE Writes a data matrix into a pgm file.
% Input:
%       M: 2-dimensional data matrix (w*h)
%       l: grey levels
%       mode: ASCII or Binary (1 for Ascii and 0 for Binary)
%       filename: give a name to the generated file

[w,h] = size(M);    % size of the image is the dimension of the matrix

% open the file in read mode
if (mode == 1) ; % Ascii mode
    f = fopen(strcat('../results/pgmppm/',filename,'_Ascii.pgm'),'w');
    fprintf(f,'P2\n');
    fprintf(f,'# Image created by Ziqian Chen\n');   % Signature.
    fprintf(f,'# image width\n');
    fprintf(f,'%i',w);
    fprintf(f,'\n# image height\n');
    fprintf(f,'%i',h);
    fprintf(f,'\n# greyscale depth\n');
    fprintf(f,'%i',l);
    fprintf(f,'\n');
    
    for i=1:w
        for j=1:h
            fprintf(f,' %s ',num2str(M(i,j)));
        end
        fprintf(f,'\n');        % start a new line for the next row of pixels
    end
    
else            % Binary mode
    f = fopen(strcat('../results/pgmppm/',filename,'_Binary.pgm'),'w');
    fprintf(f,'P5\n');
    fprintf(f,'# Image created by Ziqian Chen\n');   % Signature.
    fprintf(f,'# image width\n');
    fprintf(f,'%i',w);
    fprintf(f,'\n# image height\n');
    fprintf(f,'%i',h);
    fprintf(f,'\n# greyscale depth\n');
    fprintf(f,'%i',l);
    fprintf(f,'\n');
    
    for i=1:w
        for j=1:h
            fwrite( f, M(i,j), 'uint8' );
        end
    end
    
end
