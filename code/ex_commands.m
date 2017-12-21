% Commands for exercises 1-6
%%%%% 1a
BUPT_pgmwrite(LENA_grey, l, 0, '1a-LENA_grey');
BUPT_pgmwrite(LENA_grey, l, 1, '1a-LENA_grey');
BUPT_ppmwrite(LENA_RGB, l, 0, '1a-LENA_RGB');
BUPT_ppmwrite(LENA_RGB, l, 1, '1a-LENA_RGB');

%%%%% 1b
LENA_YUV = BUPT_format_converter(LENA_RGB);
LENA_Y = LENA_YUV(:,:,1);
LENA_RGB2 = BUPT_format_converter(LENA_YUV, 'inverse');
BABOON_YUV = BUPT_format_converter(BABOON_RGB);
BABOON_Y = BABOON_YUV(:,:,1);
BABOON_RGB2 = BUPT_format_converter(BABOON_YUV, 'inverse');
imwrite(uint8(LENA_Y), '../results/jpg/1b-LENA_Y.jpg');
imwrite(uint8(BABOON_Y), '../results/jpg/1b-BABOON_Y.jpg');
imwrite(uint8(LENA_RGB2), '../results/jpg/1b-LENA_recovered.jpg');
imwrite(uint8(BABOON_RGB2), '../results/jpg/1b-BABOON_recovered.jpg');
imwrite(uint8(LENA_YUV), '../results/jpg/1b-LENA_YUV.jpg');
% BUPT_pgmwrite(LENA_Y, l, 0, '1b-LENA_Y');
% BUPT_pgmwrite(BABOON_Y, l, 0, '1b-BABOON_Y');
% BUPT_ppmwrite(LENA_RGB2, l, 0, '1b-LENA_recovered');
% BUPT_ppmwrite(BABOON_RGB2, l, 0, '1b-BABOON_recovered');
% BUPT_ppmwrite(LENA_YUV, l, 0, '1b-LENA_YUV');

%%%%% 1c
LENA_grey_sub1 = BUPT_subsample(LENA_grey, 2, 1);
LENA_grey_sub2 = BUPT_subsample(LENA_grey, 1, 2);
LENA_grey_sub3 = BUPT_subsample(LENA_grey, 8, 2);
LENA_grey_sub4 = BUPT_subsample(LENA_grey, 4, 4);
imwrite(uint8(LENA_grey_sub1), '../results/jpg/1c-LENA_subsample2by1.jpg');
imwrite(uint8(LENA_grey_sub2), '../results/jpg/1c-LENA_subsample1by2.jpg');
imwrite(uint8(LENA_grey_sub3), '../results/jpg/1c-LENA_subsample8by2.jpg');
imwrite(uint8(LENA_grey_sub4), '../results/jpg/1c-LENA_subsample4by4.jpg');
% BUPT_pgmwrite(LENA_grey_sub1, l, 0, '1c-LENA_subsample2by1');
% BUPT_pgmwrite(LENA_grey_sub2, l, 0, '1c-LENA_subsample1by2');
% BUPT_pgmwrite(LENA_grey_sub3, l, 0, '1c-LENA_subsample8by2');
% BUPT_pgmwrite(LENA_grey_sub4, l, 0, '1c-LENA_subsample4by4');


%%%%% 2a
LENA_grey_quan2 = BUPT_quantise(LENA_grey,2);
BABOON_grey_quan8 = BUPT_quantise(BABOON_grey,8);
PEPPERS_grey_quan32 = BUPT_quantise(PEPPERS_grey,32);
PEPPERS_grey_quan128 = BUPT_quantise(PEPPERS_grey,128);
imwrite(uint8(LENA_grey_quan2), '../results/jpg/2a-LENA_grey_quan2.jpg');
imwrite(uint8(BABOON_grey_quan8), '../results/jpg/2a-BABOON_grey_quan8.jpg');
imwrite(uint8(PEPPERS_grey_quan32), '../results/jpg/2a-PEPPERS_grey_quan32.jpg');
imwrite(uint8(PEPPERS_grey_quan128), '../results/jpg/2a-PEPPERS_grey_quan128.jpg');
% BUPT_pgmwrite(LENA_grey_quan2, l, 0, '2a-LENA_grey_quan2');
% BUPT_pgmwrite(BABOON_grey_quan8, l, 0, '2a-BABOON_grey_quan8');
% BUPT_pgmwrite(PEPPERS_grey_quan32, l, 0, '2a-PEPPERS_grey_quan32');
% BUPT_pgmwrite(PEPPERS_grey_quan128, l, 0, '2a-PEPPERS_grey_quan128');


%%%%% 2b
LENA_Histo = BUPT_histogram(LENA_grey, l);
BABOON_Histo = BUPT_histogram(BABOON_grey, l);
PEPPERS_Histo = BUPT_histogram(PEPPERS_grey, l);


%%%%% 2c
LENA_equ = BUPT_equalise(LENA_grey, l);
BABOON_equ = BUPT_equalise(BABOON_grey, l);
PEPPERS_equ = BUPT_equalise(PEPPERS_grey, l);
imwrite(uint8(LENA_equ), '../results/jpg/2c-LENA_grey_equalised.jpg');
imwrite(uint8(BABOON_equ), '../results/jpg/2c-BABOON_grey_equalised.jpg');
imwrite(uint8(PEPPERS_equ), '../results/jpg/2c-PEPPERS_grey_equalised.jpg');
% BUPT_pgmwrite(LENA_equ, l, 0, '2c-LENA_grey_equalised');
% BUPT_pgmwrite(BABOON_equ, l, 0, '2c-BABOON_grey_equalised');
% BUPT_pgmwrite(PEPPERS_equ, l, 0, '2c-PEPPERS_grey_equalised');


%%%%% 2d
[PEPPERS_grey_m1, PEPPERS_grey_m2] = BUPT_histo_model(LENA_grey, PEPPERS_grey);
imwrite(uint8(PEPPERS_grey_m1), '../results/jpg/2d-PEPPERS_grey_modelled.jpg');
imwrite(uint8(PEPPERS_grey_m2), '../results/jpg/2d-PEPPERS_grey_exponential modelled.jpg');
% BUPT_pgmwrite(PEPPERS_grey_m1, l, 0, '2d-PEPPERS_grey_modelled');
% BUPT_pgmwrite(PEPPERS_grey_m2, l, 0, '2d-PEPPERS_grey_exponential');


%%%%% 3a
LENA_grey_inverted = BUPT_invert(LENA_grey, l);
PEPPERS_grey_inverted = BUPT_invert(PEPPERS_grey, l);
BABOON_grey_inverted = BUPT_invert(BABOON_grey, l);
LENA_RGB_inverted = BUPT_invert(LENA_RGB, l);
PEPPERS_RGB_inverted = BUPT_invert(PEPPERS_RGB, l);
BABOON_RGB_inverted = BUPT_invert(BABOON_RGB, l);
imwrite(uint8(LENA_grey_inverted), '../results/jpg/3a-LENA_grey_inverted.jpg');
imwrite(uint8(PEPPERS_grey_inverted), '../results/jpg/3a-PEPPERS_grey_inverted.jpg');
imwrite(uint8(BABOON_grey_inverted), '../results/jpg/3a-BABOON_grey_inverted.jpg');
imwrite(uint8(LENA_RGB_inverted), '../results/jpg/3a-LENA_RGB_inverted.jpg');
imwrite(uint8(PEPPERS_RGB_inverted), '../results/jpg/3a-PEPPERS_RGB_inverted.jpg');
imwrite(uint8(BABOON_RGB_inverted), '../results/jpg/3a-BABOON_RGB_inverted.jpg');
% BUPT_pgmwrite(LENA_grey_inverted, l, 0, '3a-LENA_grey_inverted');
% BUPT_pgmwrite(PEPPERS_grey_inverted, l, 0, '3a-PEPPERS_grey_inverted');
% BUPT_pgmwrite(BABOON_grey_inverted, l, 0, '3a-BABOON_grey_inverted');
% BUPT_ppmwrite(LENA_RGB_inverted, l, 0, '3a-LENA_RGB_inverted');
% BUPT_ppmwrite(PEPPERS_RGB_inverted, l, 0, '3a-PEPPERS_RGB_inverted');
% BUPT_ppmwrite(BABOON_RGB_inverted, l, 0, '3a-BABOON_RGB_inverted');


%%%%% 3b

CZQ_RGBnamed = insertText(uint8(CZQ_RGB), [0,400], 'CHEN ZIQIAN', 'Font', 'Arial', 'FontSize', 72, 'TextColor', 'white', 'BoxOpacity', 0.0);
CZQ_YUVnamed = BUPT_format_converter(CZQ_RGBnamed);
CZQ_greynamed = CZQ_YUVnamed(:,:,1);
imshow(uint8(CZQ_RGBnamed)); title('I assume this is legit..');
figure, imshow(uint8(CZQ_greynamed)); title('I assume this is legit.. (greyscale vers)');
imwrite(uint8(CZQ_greynamed), '../results/jpg/3b-CZQ (my image).jpg');
% BUPT_pgmwrite(CZQ_greynamed, l, 0, '3b-CZQ (my image)');

CZQ_tran_r30 = BUPT_transform(CZQ_greynamed, 30, 0);
CZQ_tran_r60 = BUPT_transform(CZQ_greynamed, 60, 0);
CZQ_tran_r120 = BUPT_transform(CZQ_greynamed, 120, 0);
CZQ_tran_rn50 = BUPT_transform(CZQ_greynamed, -50, 0);
imwrite(uint8(CZQ_tran_r30), '../results/jpg/3b-CZQ_rotated30.jpg');
imwrite(uint8(CZQ_tran_r60), '../results/jpg/3b-CZQ_rotated60.jpg');
imwrite(uint8(CZQ_tran_r120), '../results/jpg/3b-CZQ_rotated120.jpg');
imwrite(uint8(CZQ_tran_rn50), '../results/jpg/3b-CZQ_rotated-50.jpg');
% BUPT_pgmwrite(CZQ_tran_r30, l, 0, '3b-CZQ_rotated30');
% BUPT_pgmwrite(CZQ_tran_r60, l, 0, '3b-CZQ_rotated60');
% BUPT_pgmwrite(CZQ_tran_r120, l, 0, '3b-CZQ_rotated120');
% BUPT_pgmwrite(CZQ_tran_rn50, l, 0, '3b-CZQ_rotated-50');

CZQ_tran_s10 = BUPT_transform(CZQ_greynamed, 0, 10);
CZQ_tran_s40 = BUPT_transform(CZQ_greynamed, 0, 40);
CZQ_tran_s60 = BUPT_transform(CZQ_greynamed, 0, 60);
imwrite(uint8(CZQ_tran_s10), '../results/jpg/3b-CZQ_skewed10.jpg');
imwrite(uint8(CZQ_tran_s40), '../results/jpg/3b-CZQ_skewed40.jpg');
imwrite(uint8(CZQ_tran_s60), '../results/jpg/3b-CZQ_skewed60.jpg');
% BUPT_pgmwrite(CZQ_tran_s10, l, 0, '3b-CZQ_skewed10');
% BUPT_pgmwrite(CZQ_tran_s40, l, 0, '3b-CZQ_skewed40');
% BUPT_pgmwrite(CZQ_tran_s60, l, 0, '3b-CZQ_skewed60');

CZQ_tran_r20_s50 = BUPT_transform(CZQ_greynamed, 20, 50);
CZQ_tran_s50_r20 = BUPT_transform(CZQ_greynamed, 20, 50, 's');
imwrite(uint8(CZQ_tran_r20_s50), '../results/jpg/3b-CZQ_rotated20 then skewed50.jpg');
imwrite(uint8(CZQ_tran_s50_r20), '../results/jpg/3b-CZQ_skewed50 then rotated20.jpg');
% BUPT_pgmwrite(CZQ_tran_r20_s50, l, 0, '3b-CZQ_rotated20 then skewed50');
% BUPT_pgmwrite(CZQ_tran_s50_r20, l, 0, '3b-CZQ_skewed50 then rotated20');


%%%%% 4a
LENA_grey_SPnoise = BUPT_noise(uint8(LENA_grey), 's');
LENA_grey_Gnoise1 = BUPT_noise(uint8(LENA_grey), 'g', 0.01);
LENA_grey_Gnoise5 = BUPT_noise(uint8(LENA_grey), 'g', 0.05);
PEPPERS_grey_SPnoise = BUPT_noise(uint8(PEPPERS_grey), 's');
PEPPERS_grey_Gnoise2 = BUPT_noise(uint8(PEPPERS_grey), 'g', 0.02);
PEPPERS_grey_Gnoise5 = BUPT_noise(uint8(PEPPERS_grey), 'g', 0.05);
BABOON_grey_SPnoise = BUPT_noise(uint8(BABOON_grey), 's');
BABOON_grey_Gnoise7 = BUPT_noise(uint8(BABOON_grey), 'g', 0.07);
BABOON_grey_Gnoise10 = BUPT_noise(uint8(BABOON_grey), 'g', 0.1);
imwrite(uint8(LENA_grey_SPnoise), '../results/jpg/4a-LENA_grey_SPnoise.jpg');
imwrite(uint8(LENA_grey_Gnoise1), '../results/jpg/4a-LENA_grey_Gnoise1.jpg');
imwrite(uint8(LENA_grey_Gnoise5), '../results/jpg/4a-LENA_grey_Gnoise5.jpg');
imwrite(uint8(PEPPERS_grey_SPnoise), '../results/jpg/4a-PEPPERS_grey_SPnoise.jpg');
imwrite(uint8(PEPPERS_grey_Gnoise2), '../results/jpg/4a-PEPPERS_grey_Gnoise2.jpg');
imwrite(uint8(PEPPERS_grey_Gnoise5), '../results/jpg/4a-PEPPERS_grey_Gnoise5.jpg');
imwrite(uint8(BABOON_grey_SPnoise), '../results/jpg/4a-BABOON_grey_SPnoise.jpg');
imwrite(uint8(BABOON_grey_Gnoise7), '../results/jpg/4a-BABOON_grey_Gnoise7.jpg');
imwrite(uint8(BABOON_grey_Gnoise10), '../results/jpg/4a-BABOON_grey_Gnoise10.jpg');
% BUPT_pgmwrite(LENA_grey_SPnoise, l, 0, '4a-LENA_grey_SPnoise');
% BUPT_pgmwrite(LENA_grey_Gnoise1, l, 0, '4a-LENA_grey_Gnoise1');
% BUPT_pgmwrite(LENA_grey_Gnoise5, l, 0, '4a-LENA_grey_Gnoise5');
% BUPT_pgmwrite(PEPPERS_grey_SPnoise, l, 0, '4a-PEPPERS_grey_SPnoise');
% BUPT_pgmwrite(PEPPERS_grey_Gnoise2, l, 0, '4a-PEPPERS_grey_Gnoise2');
% BUPT_pgmwrite(PEPPERS_grey_Gnoise5, l, 0, '4a-PEPPERS_grey_Gnoise5');
% BUPT_pgmwrite(BABOON_grey_SPnoise, l, 0, '4a-BABOON_grey_SPnoise');
% BUPT_pgmwrite(BABOON_grey_Gnoise7, l, 0, '4a-BABOON_grey_Gnoise7');
% BUPT_pgmwrite(BABOON_grey_Gnoise10, l, 0, '4a-BABOON_grey_Gnoise10');


%%%%% 4b
LENA_RGB_upNN = BUPT_up(LENA_RGB, 'n', 4.5);
BABOON_RGB_upBilinear = BUPT_up(BABOON_RGB, 'b', 3.6);
imwrite(uint8(LENA_RGB_upNN), '../results/jpg/4b-LENA_upNN45.jpg');
imwrite(uint8(BABOON_RGB_upBilinear), '../results/jpg/4b-BABOON_upBilinear36.jpg');
% BUPT_ppmwrite(LENA_RGB_upNN, l, 0, '4b-LENA_upNN45');      % Warning: super slow...
% BUPT_ppmwrite(BABOON_RGB_upBilinear, l, 0, '4b-BABOON_upBilinear36');  % Warning: super slow...

% BUPT_up(LENA_RGB, 'both', 4.5);


%%%%% 5a
LENA_RGB_lp05 = BUPT_lowpass(LENA_RGB, 50, 0.5);
LENA_RGB_lp1 = BUPT_lowpass(LENA_RGB, 50, 1);
LENA_RGB_lp2 = BUPT_lowpass(LENA_RGB, 50, 2);
LENA_RGB_lp4 = BUPT_lowpass(LENA_RGB, 50, 4);
LENA_RGB_lp7 = BUPT_lowpass(LENA_RGB, 50, 7);
LENA_RGB_lp10 = BUPT_lowpass(LENA_RGB, 50, 10);
imwrite(uint8(LENA_RGB_lp05), '../results/jpg/5a-LENA_RGB_lp05.jpg');
imwrite(uint8(LENA_RGB_lp1), '../results/jpg/5a-LENA_RGB_lp1.jpg');
imwrite(uint8(LENA_RGB_lp2), '../results/jpg/5a-LENA_RGB_lp2.jpg');
imwrite(uint8(LENA_RGB_lp4), '../results/jpg/5a-LENA_RGB_lp4.jpg');
imwrite(uint8(LENA_RGB_lp7), '../results/jpg/5a-LENA_RGB_lp7.jpg');
imwrite(uint8(LENA_RGB_lp10), '../results/jpg/5a-LENA_RGB_lp10.jpg');
% BUPT_ppmwrite(LENA_RGB_lp05, l, 0, '5a-LENA_RGB_lp05');
% BUPT_ppmwrite(LENA_RGB_lp1, l, 0, '5a-LENA_RGB_lp1');
% BUPT_ppmwrite(LENA_RGB_lp2, l, 0, '5a-LENA_RGB_lp2');
% BUPT_ppmwrite(LENA_RGB_lp4, l, 0, '5a-LENA_RGB_lp4');
% BUPT_ppmwrite(LENA_RGB_lp7, l, 0, '5a-LENA_RGB_lp7');
% BUPT_ppmwrite(LENA_RGB_lp10, l, 0, '5a-LENA_RGB_lp10');
LENA_RGB_rect55 = BUPT_rect(LENA_RGB, [5,5]);
LENA_RGB_rect77 = BUPT_rect(LENA_RGB, [7,7]);
imwrite(uint8(LENA_RGB_rect55), '../results/jpg/5a-LENA_RGB_rect55.jpg');
imwrite(uint8(LENA_RGB_rect77), '../results/jpg/5a-LENA_RGB_rect77.jpg');
% BUPT_ppmwrite(LENA_RGB_rect55, l, 0, '5a-LENA_RGB_rect55');
% BUPT_ppmwrite(LENA_RGB_rect77, l, 0, '5a-LENA_RGB_rect77');


%%%%% 5b
LENA_grey_edgeSobel = BUPT_edge(LENA_grey, 's');
PEPPERS_RGB_edgeSobel = BUPT_edge(PEPPERS_RGB, 's');
LENA_grey_edgePrewitt = BUPT_edge(LENA_grey, 'p');
PEPPERS_RGB_edgePrewitt = BUPT_edge(PEPPERS_RGB, 'p');
LENA_grey_edgeRoberts = BUPT_edge(LENA_grey, 'r');
PEPPERS_RGB_edgeRoberts = BUPT_edge(PEPPERS_RGB, 'r');
imwrite(uint8(LENA_grey_edgeSobel), '../results/jpg/5b-LENA_grey_edgeSobel.jpg');
imwrite(uint8(PEPPERS_RGB_edgeSobel), '../results/jpg/5b-PEPPERS_RGB_edgeSobel.jpg');
imwrite(uint8(LENA_grey_edgePrewitt), '../results/jpg/5b-LENA_grey_edgePrewitt.jpg');
imwrite(uint8(PEPPERS_RGB_edgePrewitt), '../results/jpg/5b-PEPPERS_RGB_edgePrewitt.jpg');
imwrite(uint8(LENA_grey_edgeRoberts), '../results/jpg/5b-LENA_grey_edgeRoberts.jpg');
imwrite(uint8(PEPPERS_RGB_edgeRoberts), '../results/jpg/5b-PEPPERS_RGB_edgeRoberts.jpg');
% BUPT_pgmwrite(LENA_grey_edgeSobel, l, 0, '5b-LENA_grey_edgeSobel');
% BUPT_ppmwrite(PEPPERS_RGB_edgeSobel, l, 0, '5b-PEPPERS_RGB_edgeSobel');
% BUPT_pgmwrite(LENA_grey_edgePrewitt, l, 0, '5b-LENA_grey_edgePrewitt');
% BUPT_ppmwrite(PEPPERS_RGB_edgePrewitt, l, 0, '5b-PEPPERS_RGB_edgePrewitt');
% BUPT_pgmwrite(LENA_grey_edgeRoberts, l, 0, '5b-LENA_grey_edgeRoberts');
% BUPT_ppmwrite(PEPPERS_RGB_edgeRoberts, l, 0, '5b-PEPPERS_RGB_edgeRoberts');


%%%%% 6
LENA_grey_log1 = BUPT_log(LENA_grey, 1);
PEPPERS_grey_log3 = BUPT_log(PEPPERS_grey, 3);
BABOON_grey_log1 = BUPT_log(BABOON_grey, 1);
BABOON_grey_log2 = BUPT_log(BABOON_grey, 2);
BABOON_grey_log3 = BUPT_log(BABOON_grey, 3);
imwrite(uint8(LENA_grey_log1), '../results/jpg/6-LENA_grey_log1.jpg');
imwrite(uint8(PEPPERS_grey_log3), '../results/jpg/6-PEPPERS_grey_log3.jpg');
imwrite(uint8(BABOON_grey_log1), '../results/jpg/6-BABOON_grey_log1.jpg');
imwrite(uint8(BABOON_grey_log2), '../results/jpg/6-BABOON_grey_log2.jpg');
imwrite(uint8(BABOON_grey_log3), '../results/jpg/6-BABOON_grey_log3.jpg');
% BUPT_pgmwrite(LENA_grey_log1, l, 0, '6-LENA_grey_log1');
% BUPT_pgmwrite(PEPPERS_grey_log3, l, 0, '6-PEPPERS_grey_log3');
% BUPT_pgmwrite(BABOON_grey_log1, l, 0, '6-BABOON_grey_log1');
% BUPT_pgmwrite(BABOON_grey_log2, l, 0, '6-BABOON_grey_log2');
% BUPT_pgmwrite(BABOON_grey_log3, l, 0, '6-BABOON_grey_log3');

LENA_grey_log5ker20 = BUPT_log(LENA_grey, 5, 20);
PEPPERS_grey_log4ker15 = BUPT_log(PEPPERS_grey, 4, 15);
imwrite(uint8(LENA_grey_log5ker20), '../results/jpg/6-LENA_grey_log5ker20.jpg');
imwrite(uint8(PEPPERS_grey_log4ker15), '../results/jpg/6-PEPPERS_grey_log4ker15.jpg');
% BUPT_pgmwrite(LENA_grey_log5ker20, l, 0, '6-LENA_grey_log5ker20');
% BUPT_pgmwrite(PEPPERS_grey_log4ker15, l, 0, '6-PEPPERS_grey_log4ker15');
