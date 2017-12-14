% Commands for exercises 1-6

%%%%% 1b
LENA_YUV = BUPT_format_converter(LENA_RGB);
LENA_RGB2 = BUPT_format_converter(LENA_YUV, 'inverse');
% pgmwrite(LENA_YUV(:,:,1), l, 1, '1b_LENA');
% ppmwrite(LENA_RGB2, l, 0, '1b_LENA_recovered');
BABOON_YUV = BUPT_format_converter(BABOON_RGB);
BABOON_RGB2 = BUPT_format_converter(BABOON_YUV, 'inverse');
% pgmwrite(BABOON_YUV(:,:,1), l, 0, '1b_BABOON');


%%%%% 1c
LENA_grey_sub1 = BUPT_subsample(LENA_grey, 2, 1);
LENA_grey_sub2 = BUPT_subsample(LENA_grey, 1, 2);
LENA_grey_sub3 = BUPT_subsample(LENA_grey, 8, 2);
LENA_grey_sub4 = BUPT_subsample(LENA_grey, 4, 4);
% pgmwrite(LENA_grey_sub1, l, 0, '1c_LENA_subsample2by1');
% pgmwrite(LENA_grey_sub2, l, 0, '1c_LENA_subsample1by2');
% pgmwrite(LENA_grey_sub3, l, 0, '1c_LENA_subsample8by2');
% pgmwrite(LENA_grey_sub4, l, 0, '1c_LENA_subsample4by4');


%%%%% 2a
LENA_grey_quan2 = BUPT_quantise(LENA_grey,2);
BABOON_grey_quan8 = BUPT_quantise(BABOON_grey,8);
PEPPERS_grey_quan32 = BUPT_quantise(PEPPERS_grey,32);
PEPPERS_grey_quan128 = BUPT_quantise(PEPPERS_grey,128);
% pgmwrite(LENA_grey_quan2, l, 0, '2a_LENA_grey_quan2');
% pgmwrite(BABOON_grey_quan8, l, 0, '2a_BABOON_grey_quan8');
% pgmwrite(PEPPERS_grey_quan32, l, 0, '2a_PEPPERS_grey_quan32');
% pgmwrite(PEPPERS_grey_quan128, l, 0, '2a_PEPPERS_grey_quan128');


%%%%% 2b
H = BUPT_histogram(LENA_grey, l);


%%%%% 2c



%%%%% 2d


%%%%% 3a
LENA_grey_inverted = BUPT_invert(LENA_grey, l);
LENA_RGB_inverted = BUPT_invert(LENA_RGB, l);

%%%%% 3b


%%%%% 4a
BUPT_noise(uint8(LENA_grey), 1, 0.05);


