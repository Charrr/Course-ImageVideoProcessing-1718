% Read all images into matrices
l = 255;    % default

BABOON_RGB = BUPT_ppmread('../dataset/Baboon512C_ASCII2014.ppm');
LENA_RGB = BUPT_ppmread('../dataset/Lena512C_ASCII2014.ppm');
PEPPERS_RGB = BUPT_ppmread('../dataset/Peppers512C_ASCII2014.ppm');

BABOON_grey = BUPT_pgmread('../dataset/Baboon512_binary2014.pgm');
LENA_grey = BUPT_pgmread('../dataset/Lena512_Binary2014.pgm');
PEPPERS_grey = BUPT_pgmread('../dataset/Peppers512_binary2014.pgm');

CZQ_RGB = double(imread('../dataset/czq.jpg'));
CZQ2_grey = double(imread('../dataset/czq2_grey.jpg'));

% CZQ2_RGB = double(imread('../dataset/czq2.jpg'));
% CZQ_grey = BUPT_format_converter(CZQ_RGB);
% CZQ_grey = CZQ_grey(:,:,1);
% CZQ_RGBnamed = insertText(CZQ_RGB, [0,200], 'CHEN ZIQIAN', 'Font', 'Arial', 'FontSize', 72, 'BoxOpacity', 0.5, 'TextColor', 'magenta');
% CZQ_greynamed = BUPT_format_converter(CZQ_RGBnamed);
% CZQ_greynamed = CZQ_greynamed(:,:,1);