function [ OUT ] = BUPT_transform( IN, th1, th2, RotateOrSkewFirst )
%3b Rotates an image with an angle theta1 and skews it with theta2
%   Input:
%       IN: input image matrix
%       theta1: rotation angle (degree)
%    	theta2: skew angle (degree)
%     	RotateThenSkew: 's' if first skew then rotate, otherwise rotate first.
%     	defalt as 1.
%   Output:
%    	OUT: output image matrix


% read the image
[h, w] = size(IN);

% correct the angle
theta1=th1/180*pi;
theta2=-(90-th2)/180*pi;

R=[cos(theta1) -sin(theta1) 0;sin(theta1) cos(theta1) 0;0 0 1];
if theta2==0
    S=[1 0 0;0 1 0;0 0 1];
else
    S=[1 1/(tan(theta2)) 0;0 1 0;0 0 1];
end

if nargin == 4 && strcmp(RotateOrSkewFirst, 's')
    T=R*S;
else
    T=S*R;      % default (rotation first than skew)
end

C1=T*[1 1 1]';
C2=T*[w h 1]';
C3=T*[1 h 1]';
C4=T*[w 1 1]';
% Adjust to the new size
NewMax=max(C1,max(C2,max(C3,C4)));
NewMin=min(C1,min(C2,min(C3,C4)));
NewMax=round(NewMax);
NewMin=round(NewMin);

% Initialise
IN_new = zeros(NewMax(2)-NewMin(2)+1,1+NewMax(1)-NewMin(1));

% rotation
for i=1:h
    for j=1:w
        coor=T*[j i 1]';
        IN_new(round(coor(2))-NewMin(2)+1,1+round(coor(1))-NewMin(1))=IN(i,j);
    end
end

wnew=NewMax(1)-NewMin(1)+1;
hnew=NewMax(2)-NewMin(2)+1;

% solve the black pixels problem
for i=1:hnew
    for j=1:wnew
        if IN_new(i,j)==0
            CoorOld=round(inv(T)*[j+NewMin(1)-1 i+NewMin(2)-1 1]');
            if CoorOld(1)>0&&CoorOld(2)>0&&CoorOld(1)<w&&CoorOld(2)<h
                IN_new(i,j)=IN(CoorOld(2),CoorOld(1));
            end
        end
    end
end

OUT = IN_new;

figure, imshow(uint8(OUT));
title(strcat('rotated by ',num2str(th1),', ',' skewed by ',num2str(th2)));

end

