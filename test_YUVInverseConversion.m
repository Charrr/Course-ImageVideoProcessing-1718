C = [0.257,  0.504,  0.098, 16;
    -0.148, -0.291,  0.439, 128;
     0.439, -0.368, -0.071, 128;
     0,      0,      0,     1];   % RGB to YUV

D = inv(C);  % YUV to RGB

m = 200;
n = 400;

[RGBcomplete, l] = ppmread('img2014/Baboon512C_ASCII2014.ppm');
RGB = RGBcomplete(1:m, 1:n, 1:3);  % Just take 100 by 100.
YUV = BUPT_format_converter(RGB);
YUV_ = YUV;
YUV_(:,:,4) = ones(m,n);    % The non-homogeneous 4th dimension.
YUV_reshaped = reshape(YUV_, m*n, 4);
RGB_reshaped = D * YUV_reshaped';
RGB_ = reshape(RGB_reshaped', m, n, 4);
RGB2 = round(RGB_(:,:,1:3));

diff = RGB2 - RGB;

figure, 
subplot(3,1,1), imshow(uint8(RGB)); title('Original RGB');
subplot(3,1,2), imshow(uint8(RGB2)); title('Recovered RGB');
subplot(3,1,3), imshow(uint8(diff*100)); title('error (magnified by 100)');