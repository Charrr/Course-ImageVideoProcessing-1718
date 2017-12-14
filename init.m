% Read all images into matrices
l = 255;    % default

BABOON_RGB = ppmread('img2014/Baboon512C_ASCII2014.ppm');
LENA_RGB = ppmread('img2014/Lena512C_ASCII2014.ppm');
PEPPERS_RGB = ppmread('img2014/Peppers512C_ASCII2014.ppm');

BABOON_grey = pgmread('img2014/Baboon512_binary2014.pgm');
LENA_grey = pgmread('img2014/Lena512_Binary2014.pgm');
PEPPERS_grey = pgmread('img2014/Peppers512_binary2014.pgm');

CZQ_RGB = imread('img2014/czq.jpg');
CZQ_grey = BUPT_format_converter(CZQ_RGB);
CZQ_grey = CZQ_grey(:,:,1);
CZQ_RGBnamed = insertText(CZQ_RGB, [20,400], 'CHEN ZIQIAN', 'Font', 'Arial', 'FontSize', 72, 'BoxOpacity', 0, 'TextColor', 'white');
% CZQ_greynamed = insertText(CZQ_grey, [20,400], 'CHEN ZIQIAN', 'Font', 'Arial', 'FontSize', 72, 'BoxOpacity', 0, 'TextColor', 'white');
CZQ_greynamed = BUPT_format_converter(CZQ_RGBnamed);
CZQ_greynamed = CZQ_greynamed(:,:,1);