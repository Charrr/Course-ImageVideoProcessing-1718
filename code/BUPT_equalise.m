function [ OUT ] = BUPT_equalise( IN, l )
%2c Equalises grey-scale images based on their histogram
%   Input:
%       IN: input greyscale matrix
%       l:  colour level of the image
%   Output:
%       OUT: output greyscale matrix

[h,w] = size(IN);
%
% % get the histograms
% Hist = BUPT_histogram(IN, l); title('Original Histogram');
%
% % use proper expression to get equalized image
% c=zeros(1,256);
% c(1)=Hist(1);
% for i=1:255
%     c(i+1)=c(i)+Hist(i+1);
% end
% cmin=min(c);
% eh=zeros(1,256);
% for i=1:256
%     eh(i)=round((c(i)-cmin)*255/(w*h-cmin));
% end
% OUT=0*IN;
% for i=0:255
%     idx=find(IN==i);
%     OUT(idx)=eh(i+1);
% end
%
% figure, imshow(uint8(OUT)); title('Equalised Image');
% BUPT_histogram(OUT, l); title('Equalised Histogram');

H=zeros(1,l+1);% The index should be a positive integer
tem=zeros(1,l+1);
E=zeros(1,l+1);
J=zeros(1,l+1);

for k=0:l
    H(k+1)= length(find(IN==k));% count of each value
end

for i = 1:(l+1)
    for j = 1:i
        tem(i)= H(j)+tem(i); % Use the equalizae function to realize
    end
end

for i=1:(l+1)
    E(i)=round(tem(i)/1024);
end

for i=0:l
    J(i+1)=sum(H(find(E==i)));
end

newI = IN;
for i=0:l
    newI(find(IN==i))=E(i+1);
end
OUT = newI;

% figure, bar(0:255,J), title('Equalized file');
% figure, bar(0:255,H), title('Source file');
figure,
subplot(2,2,4), bar(0:l, J/(w*h), 'k'), title('Equalised histogram');
subplot(2,2,2), bar(0:l, H/(w*h), 'k'), title('Original histogram');
subplot(2,2,3), imshow(uint8(OUT)), title('Equalised image');
subplot(2,2,1), imshow(uint8(IN)), title('Original image')

end

