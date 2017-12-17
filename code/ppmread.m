function [M,level] = ppmread(path)
%PPMREAD Reads a ppm file into a data matrix.
% Input:
%       path: path of the ppm file
% Output: (Data type: double)
%       M: the data matrix
%       l: colour levels

% open the file in read mode
f = fopen(path,'r');
A = 0 ; % Ascii flag
% ignore the comments in the file
a = fscanf(f,'%s',1);
while(a(1)=='#')
    a = fscanf(f,'%s',1);
end

% check the magic number
if ((strcmp(a,'P3')==0) && (strcmp(a,'P6')==0)) % neither P3 nor P6
    while(a(1)=='#')
        a = fscanf(f,'%s',1);
    end
    error('It''s not a ppm file. Try using pgmread instead.');
else
    if(strcmp(a,'P3'))
        A = 1;      % ASCII mode
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
    a = fscanf(f,'%s',1);
    
    while(a(1) == '#')
        b = fgets(f); % throw away the comments line
        a = fscanf(f,'%s',1);
    end
    level = str2num(a); % colour levels
    
    if (A == 1)     % if it's in ascii mode
        for i = 1:h
            for j = 1:w
                M(i,j,1) = fscanf(f,'%i',1); % Red
                M(i,j,2) = fscanf(f,'%i',1); % Green
                M(i,j,3) = fscanf(f,'%i',1); % Blue
            end
        end
    else            % if it's in binary mode
        % Skip one more char
        fread(f,1);
        % Now read the data
        Arr = uint8(fread(f));
        index = 0;
        for i = 1:h
            for j = 1:w
                index = index+1;
                M(i,j,1) = Arr(index);
                index = index+1;
                M(i,j,2) = Arr(index);
                index = index+1;
                M(i,j,3) = Arr(index);
            end
        end
    end
    
    M = double(M);  % Convert the data type to double, in case of uint8.
end

