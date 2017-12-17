% Commands for exercises 1-6

%%%%% 1b
LENA_YUV = BUPT_format_converter(LENA_RGB);
LENA_Y = LENA_YUV(:,:,1);
LENA_RGB2 = BUPT_format_converter(LENA_YUV, 'inverse');

pgmwrite(LENA_Y, l, 1, '1b_LENA');
imwrite(uint8(LENA_Y), '../results/jpg/1b_LENA_Y.jpg');
% ppmwrite(LENA_RGB2, l, 0, '1b_LENA_recovered');
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
LENA_Histo = BUPT_histogram(LENA_grey, l);
BABOON_Histo = BUPT_histogram(BABOON_grey, l);
PEPPERS_Histo = BUPT_histogram(PEPPERS_grey, l);

%%%%% 2c
LENA_equ = BUPT_equalise(LENA_grey, l);
BABOON_equ = BUPT_equalise(BABOON_grey, l);
PEPPERS_equ = BUPT_equalise(PEPPERS_grey, l);

%%%%% 2d
[PEPPERS_grey_m1, PEPPERS_grey_m2] = BUPT_histo_model(LENA_grey, PEPPERS_grey);

%%%%% 3a
LENA_grey_inverted = BUPT_invert(LENA_grey, l);
LENA_RGB_inverted = BUPT_invert(LENA_RGB, l);

%%%%% 3b
CZQ_3b1 = BUPT_transform(CZQ_greynamed, -20, 30, 0);

%%%%% 4a
BUPT_noise(uint8(LENA_grey), 'g', 0.05);
BUPT_noise(uint8(LENA_grey), 's');

%%%%% 4b
BUPT_up(LENA_RGB, 'n', 0.15);
BUPT_up(LENA_RGB, 'b', 0.15);
BUPT_up(LENA_RGB, 'both', 2);


%%%%% 5a
BUPT_lowpass(LENA_RGB, 50, 7);
BUPT_rect(LENA_RGB, [5,5]);

%%%%% 5b
BUPT_edge(LENA_RGB, 'p');

%%%%% 6
BUPT_log(LENA_RGB, 10, 3);


