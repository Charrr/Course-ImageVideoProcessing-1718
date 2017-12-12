%

% 1b
[LENA_RGB, l] = ppmread('img2014/Lena512C_Binary2014.ppm');
LENA_YUV = BUPT_format_converter(LENA_RGB);
LENA_RGB2 = BUPT_format_converter(LENA_YUV, 'inverse');
% pgmwrite(LENA_YUV(:,:,1), l, 1, '1b_LENA');

[BABOON_RGB, l] = ppmread('img2014/Baboon512C_ASCII2014.ppm');
BABOON_YUV = BUPT_format_converter(BABOON_RGB);
BABOON_RGB2 = BUPT_format_converter(BABOON_YUV, 'inverse');
% pgmwrite(BABOON_YUV(:,:,1), l, 0, '1b_BABOON');