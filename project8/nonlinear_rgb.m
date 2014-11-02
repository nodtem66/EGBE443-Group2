clear; close all; clc;
pic_rgb = imread('../project8/rose.jpg');
info_rgb = imfinfo('../project8/rose.jpg');
pic = rgb2gray(pic_rgb);
maxVal = 2^(info_rgb.BitDepth/3);
%% Gaussian Noise
pic_gn = imnoise(pic, 'gaussian');
subplot(221), imshow(pic_gn, [0 maxVal-1]); 
title('Gaussian Noise');
F = nonlinear_filter('med', pic_gn, [5 5]);
subplot(222), imshow(F, [0 maxVal-1]);
title('Median Filter');
F = nonlinear_filter('min', pic_gn, [5 5]);
subplot(223), imshow(F, [0 maxVal-1]);
title('Minimum Filter');
F = nonlinear_filter('max', pic_gn, [5 5]);
subplot(224), imshow(F, [0 maxVal-1]);
title('Maximum Filter');
%% Poisson Noise
pic_pn = imnoise(pic, 'poisson');
figure
subplot(221), imshow(pic_pn, [0 maxVal-1]);
title('Poisson Noise');
F = nonlinear_filter('med', pic_pn, [5 5]);
subplot(222), imshow(F, [0 maxVal-1]);
title('Median Filter');
F = nonlinear_filter('min', pic_pn, [5 5]);
subplot(223), imshow(F, [0 maxVal-1]);
title('Minimum Filter');
F = nonlinear_filter('max', pic_pn, [5 5]);
subplot(224), imshow(F, [0 maxVal-1]);
title('Maximum Filter');
%% Salt & Pepper Noise
pic_spn = imnoise(pic, 'salt & pepper');
figure
subplot(221), imshow(pic_spn, [0 maxVal-1]);
title('Salt & Pepper Noise');
F = nonlinear_filter('med', pic_spn, [5 5]);
subplot(222), imshow(F, [0 maxVal-1]);
title('Median Filter');
F = nonlinear_filter('min', pic_spn, [5 5]);
subplot(223), imshow(F, [0 maxVal-1]);
title('Minimum Filter');
F = nonlinear_filter('max', pic_spn, [5 5]);
subplot(224), imshow(F, [0 maxVal-1]);
title('Maximum Filter');