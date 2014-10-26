clear; clc; close all;
%% rgb file
pic = imread('aaa.jpg');
pic_info = imfinfo('aaa.jpg');
pic_n = rgb2gray(pic);
maxVal = 2^(pic_info.BitDepth/3);

%% function
gaussian_f = @(sigma) (@(x,y) ((exp(-(x.^2 + y.^ 2) ./ ( 2 .* (sigma .^ 2))))));
maxican_hat_f = @(sigma) (@(x,y) ((2/(sqrt(3*sigma)*pi^0.25)) .* (1-(x.^2+y.^2)/sigma^2) .* exp(-1/2 .* (x.^2+y.^2)/sigma^2)));

%% ploting
subplot('Position', [0.33 0.5 .33 .5]);
imshow(pic_n, [0 maxVal-1]);title('Real Image');
subplot('Position', [0 0 .33 .5]);
o = window_filter(pic_n, gaussian_f(1), [7 7]);
imshow(o, [0 maxVal-1]);title('Noisy Real Image with Gaussian Filter : \sigma = 1 (7 \times 7)');
subplot('Position', [0.33 0 .33 .5]);
g = window_filter(pic_n, gaussian_f(3), [7 7]);
imshow(g, [0 maxVal-1]);title('Noisy Real Image with Gaussian Filter : \sigma = 3 (7 \times 7)');
subplot('Position', [0.66 0 .33 .5]);
h = window_filter(pic_n, gaussian_f(3), [17 17]);
imshow(h, [0 maxVal-1]);title('Noisy Real Image with Gaussian Filter : \sigma  = 3 (17 \times 17)');