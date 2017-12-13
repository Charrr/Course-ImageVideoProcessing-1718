% Read all images into matrices
l = 255;    % default

BABOON_RGB = ppmread('img2014/Baboon512C_ASCII2014.ppm');
LENA_RGB = ppmread('img2014/Lena512C_ASCII2014.ppm');
PEPPERS_RGB = ppmread('img2014/Peppers512C_ASCII2014.ppm');

BABOON_grey = pgmread('img2014/Baboon512_binary2014.pgm');
LENA_grey = pgmread('img2014/Lena512_Binary2014.pgm');
PEPPERS_grey = pgmread('img2014/Peppers512_binary2014.pgm');