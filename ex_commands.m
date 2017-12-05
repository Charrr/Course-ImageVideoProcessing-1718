%

% 1b
[LENA_RGB, l] = ppmread('img2014/Lena512C_ASCII2014.ppm');
LENA_Grey = BUPT_format_converter(LENA_RGB);
pgmwrite(LENA_Grey, l, 1, '1b_LENA');

[BABOON_RGB, l] = ppmread('img2014/Baboon512C_Binary2014.ppm');
BABOON_Grey = BUPT_format_converter(BABOON_RGB);
pgmwrite(BABOON_Grey, l, 0, '1b_BABOON');