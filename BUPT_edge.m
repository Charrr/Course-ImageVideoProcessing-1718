function [ OUT ] = BUPT_edge( IN, oper )
%5b Detects edges by Sobel/Roberts/Prewitt operator.
%   Input:
%       IN: input matrix
%       oper: 's' for Sobel, 'p' for Prewitt, 'r' for Roberts
%   Output:
%       OUT: output matrix

if strcmp(oper,'s')
    Tx=[ 1 0 -1; 2 0 -2; 1 0 -1]; %Define the all types module
    Ty=[ -1 -2 -1; 0 0 0; 1 2 1];
elseif strcmp(oper,'r')
    Tx=[ 0 0 -1; 0 1 0; 0 0 0];
    Ty=[ -1 0 0; 0 1 0; 0 0 0];
elseif strcmp(oper,'p')
    Tx=[ 1 0 -1; 1 0 -1; 1 0 -1];
    Ty=[ -1 -1 -1; 0 0 0; 1 1 1];
else
    error('Please input ''s'', ''r'' or ''p'' for the second parameter');
end

hx = double(imfilter(IN,Tx,'replicate'));
hy = double(imfilter(IN,Ty,'replicate'));
h = ((hx.*hx)+(hy.*hy)).^0.5;
OUT = uint8(h);

imshow(uint8(OUT)); title('Edge detection');

% isGreyscale = 0;
% [h,w] = size(IN);
% if length(size(IN)) == 1
%     isGreyscale = 1;
% end
%
% % I = zeros(h,w);
%
%
% if isGreyscale==1
%     %     I = [ones(1,w); IN; ones(1,w)];
%     %     I = [ones(h+2,1), I, ones(h+2,1)];
%     I = zeros(h+2,w+2);
%     I(2:(h+1),2:(w+1)) = IN;
% else
% %     for i=1:3
% %         I(:,:,i) = [ones(1,w); IN(:,:,i); ones(1,w)];
% %         I(:,:,i) = [ones(h+2,1), I(:,:,i), ones(h+2,1)];
% %     end
%     I = zeros(h+2,w+2,3);
%     I(2:(h+1),2:(w+1),1:3) = IN;
% end
%
% I_new = 0*I;
%
% if isGreyscale==1 && strcmp(oper,'s')
%     for i=1:w
%         for j=1:h
%             if i>1&&j>1&&i<w&&j<h
%                 I_new(i,j)=I(i-1,j+1)+2*I(i,j+1)+I(i+1,j+1)-I(i-1,j-1)-2*I(i,j-1)-I(i+1,j-1)+I(i-1,j+1)+2*I(i-1,j)+I(i-1,j+1)-I(i+1,j-1)-2*I(i+1,j)-I(i+1,j+1);
%             else
%                 I_new(i,j)=0;
%             end
%         end
%     end
%     imshow(uint8(I_new)); title('Edge detection by Sobel');
% end
% if isGreyscale==1 &&strcmp(oper,'r')
%
%     threshold=15;
%     for i=1:w-1
%         for j=1:h-1
%             robertsNum = abs(I(i,j)-I(i+1,j+1)) + abs(I(i+1,j)-I(i,j+1));
%             if(robertsNum > threshold)
%                 I_new(i,j)=255;
%             else
%                 I_new(i,j)=0;
%             end
%         end
%     end
%     imshow(uint8(I_new)); title('Edge detection by Roberts');
% end
% if isGreyscale==1 && strcmp(oper,'p')
%     for i=2:w-1
%         for j=2:h-1
%             Gi=abs(I(i-1,j-1)+I(i-1,j)+I(i-1,j+1)-I(i+1,j-1)+I(i+1,j)+I(i+1,j+1));
%             Gj=abs(I(i-1,j+1)+I(i,j+1)+I(i+1,j+1)-I(i-1,j-1)+I(i,j-1)+I(i+1,j+1));
%             I_new(i,j)=max(Gi,Gj);
%         end
%     end
%     imshow(uint8(I_new)); title('Edge detection by Prewitt');
% end
% if isGreyscale==0 && strcmp(oper,'s')
%
%     for i=2:w-1
%         for j=2:h-1
%             for k=1:3
%                 I_new(i,j,k)=I(i-1,j+1,k)+2*I(i,j+1,k)+I(i+1,j+1,k)-I(i-1,j-1,k)-2*I(i,j-1,k)-I(i+1,j-1,k)+I(i-1,j+1,k)+2*I(i-1,j,k)+I(i-1,j+1,k)-I(i+1,j-1,k)-2*I(i+1,j,k)-I(i+1,j+1,k);
%             end
%         end
%     end
%     imshow(uint8(I_new)); title('Edge detection by Sobel');
% end
% if isGreyscale==0 && strcmp(oper,'r')
%
%     threshold=15;
%     for i=1:w-1
%         for j=1:h-1
%             robertsNum1 = abs(I(i,j,1)-I(i+1,j+1,1)) + abs(I(i+1,j,1)-I(i,j+1,1));
%             robertsNum2 = abs(I(i,j,2)-I(i+1,j+1,2)) + abs(I(i+1,j,2)-I(i,j+1,2));
%             robertsNum3 = abs(I(i,j,3)-I(i+1,j+1,3)) + abs(I(i+1,j,3)-I(i,j+1,3));
%             if(robertsNum1 > threshold)
%                 I_new(i,j,1)=255;
%             else
%                 I_new(i,j,1)=0;
%             end
%             if(robertsNum2 > threshold)
%                 I_new(i,j,2)=255;
%             else
%                 I_new(i,j,2)=0;
%             end
%             if(robertsNum3 > threshold)
%                 I_new(i,j,3)=255;
%             else
%                 I_new(i,j,3)=0;
%             end
%
%         end
%     end
%     imshow(uint8(I_new)); title('Edge detection by Roberts');
% end
% if isGreyscale==0 && strcmp(oper,'p')
%     for i=2:w-1
%         for j=2:h-1
%             for k=1:3
%                 Gi=abs(I(i-1,j-1,k)+I(i-1,j,k)+I(i-1,j+1,k)-I(i+1,j-1,k)+I(i+1,j,k)+I(i+1,j+1,k));
%                 Gj=abs(I(i-1,j+1,k)+I(i,j+1,k)+I(i+1,j+1,k)-I(i-1,j-1,k)+I(i,j-1,k)+I(i+1,j+1,k));
%                 I_new(i,j,k)=max(Gi,Gj);
%             end
%         end
%     end
%     imshow(uint8(I_new)); title('Edge detection by Prewitt');
% end
%
% OUT = I_new;

end

