%image created by Jiayi Ma
function testHistoModel
%*****************************************************
% Title: BUPT_histogram_modelling [Exercise 2 (d)]
% Description: Histogram modelling 

imgi=imread('img2014/Lena512_Binary2014.pgm');
histi=imhist(imgi); 
[w h]=size(imgi);
pi=histi/(w*h);

G=[];  
for i=1:256
    G=[G sum(pi(1:i))];
end

img=imread('img2014/Peppers512_binary2014.pgm');
[m n]=size(img);
histt=imhist(img);  
pt=histt/(m*n);           

s=[];    
for i=1:256
    s=[s sum(pt(1:i))];
end

for i=1:256
    tmp{i}=G-s(i);
    tmp{i}=abs(tmp{i}); 
    [a index(i)]=min(tmp{i});
end

imgn=zeros(m,n);
for i=1:m
   for j=1:n
      imgn(i,j)=index(img(i,j)+1)-1;  
   end
end

imgn=uint8(imgn);
figure, imshow('img2014/Lena512_Binary2014.pgm');title('2012213073-imageA');
figure, imshow('img2014/Peppers512_binary2014.pgm');title('2012213073-imageB');
figure, imshow(imgn); title('new');
figure, bar(imhist(imgi));title('2012213073-HistoA');
figure, bar(imhist(img));title('2012213073-HistoB');
figure, bar(imhist(imgn)); title('new histogram');
    
for i=-255:0
    e(i+256)=1.6^(i/16);
end;

G=[];  
for i=1:256
    G=[G e(i)];
end

img=imread('img2014/Peppers512_binary2014.pgm');
[m n]=size(img);
histt=imhist(img);  
pt=histt/(m*n);           

s=[];    
for i=1:256
    s=[s sum(pt(1:i))];
end

for i=1:256
    tmp{i}=G-s(i);
    tmp{i}=abs(tmp{i});
    [a index(i)]=min(tmp{i});
end

imgn=zeros(m,n);
for i=1:m
   for j=1:n
      imgn(i,j)=index(img(i,j)+1)-1;
   end
end

imgn=uint8(imgn);

figure, imshow(img); title('7');
figure, bar(imhist(img)); title('8');
figure, imshow(imgn); title('9');
figure, bar(imhist(imgn)); title('10');