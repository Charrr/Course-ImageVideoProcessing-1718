function [M,level] = pgmread(path)
%PGMREAD Reads a pgm file into a data matrix.
% Input:
%       path: path of the pgm file
% Output:
%       M: the data matrix (Data type: double)
%       l: greyscale level

% open the file in read mode
f = fopen(path,'r');
A = 0 ; % Ascii flag
% ignore the comments in the file
a = fscanf(f,'%s',1);
while(a(1)=='#')
    a = fscanf(f,'%s',1);
end

% check the magic number
if ((strcmp(a,'P5')==0) && (strcmp(a,'P2')==0))
    while(a(1)=='#')
        a = fscanf(f,'%s',1);
    end
    error('It''s not a pgm file. Try using ppmread instead.');
else
    if(strcmp(a,'P2'))
        A = 1;      % it is in ASCII mode
    end
    a = fscanf(f,'%s',1);
    while(a(1) == '#')
        b = fgets(f);        % throw away the comments line
        a = fscanf(f,'%s',1); % read first character of next line
    end
    
    w = str2num(a);      % width of the image
    a = fscanf(f,'%s',1);
    while(a(1) == '#')
        b = fgets(f);
        a = fscanf(f,'%s',1);
    end
    h = str2num(a);  % height of the image
    a= fscanf(f,'%s',1);
    while(a(1) == '#')
        b = fgets(f); % throw away the comments line
        a = fscanf(f,'%s',1);
    end
    level = str2num(a); % grey levels
    
    if (A == 1)
        for i = 1:h
            for j = 1:w
                M(i,j) = fscanf(f,'%i',1); % Greyscale
            end
        end
    else
        % Skip one more char
        fread(f,1);
        % Now read the data
        Arr = uint8(fread(f));
        index = 0;
        for i = 1:h
            for j = 1:w
                index = index+1;
                M(i,j) = Arr(index);
            end
        end
    end
    
    M = double(M);  % Convert the data type to double, in case of uint8.
end
