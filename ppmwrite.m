function ppmwrite(I,l,mode)
%PPMWRITE Writes a data matrix into a ppm file.
% Input Parameters:
%                I: 3-dimenstional data matrix (w*h*3)
%                l: colour levels
%             mode: ASCII or Binary (1 for Ascii and 0 for Binary)

[w,h] = size(I(:,:,1));     % size of the image is the dimension of the matrix

% open the file in read mode
if (mode == 1) ; % Ascii mode
    f = fopen('outascii.ppm','w');
    fprintf(f,'P3\n');
    fprintf(f,'#Image created by Ziqian Chen\n');   % Signature.
    fprintf(f,'\n# image width\n');
    fprintf(f,'%i',w);
    fprintf(f,'\n# image height\n');
    fprintf(f,'%i',h);
    fprintf(f,'\n# colour depth\n');
    fprintf(f,'%i',l);
    fprintf(f,'\n');
    
    for i=1:w
        for j=1:h
            fprintf(f,' %s ',num2str(I(i,j,1))); % R
            fprintf(f,' %s ',num2str(I(i,j,2))); % G
            fprintf(f,' %s ',num2str(I(i,j,3))); % B
            fprintf(f,'\n');
        end
    end
    
else            % Binary mode
    f = fopen('outbinary.ppm','w');
    fprintf(f,'P6\n');
    fprintf(f,'#Image created by Ziqian Chen\n');   % Signature.
    fprintf(f,'\n# image width\n');
    fprintf(f,'%i',w);
    fprintf(f,'\n# image height\n');
    fprintf(f,'%i',h);
    fprintf(f,'\n# colour depth\n');
    fprintf(f,'%i',l);
    fprintf(f,'\n');
    
    for i=1:w
        for j=1:h
            fprintf(f,'%c',I(i,j,1)); % R
            fprintf(f,'%c',I(i,j,2)); % G
            fprintf(f,'%c',I(i,j,3)); % B
        end
    end
    
end
