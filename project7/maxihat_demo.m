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
o = window_filter(double(pic_n), maxican_hat_f(1.1), [3 3], true);
imshow(o, [0 maxVal-1]);title('Noisy Real Image with Maxican Hat Filter : \sigma = 1.1 (3 \times 3)');
subplot('Position', [0.33 0 .33 .5]);
g = window_filter(double(pic_n), maxican_hat_f(1.8), [3 3], true);
imshow(g, [0 maxVal-1]);title('Noisy Real Image with Maxican Hat Filter : \sigma = 1.8 (3 \times 3)');
subplot('Position', [0.66 0 .33 .5]);
h = window_filter(double(pic_n), maxican_hat_f(1.8), [5 5], true);
imshow(h, [0 maxVal-1]);title('Noisy Real Image with Maxican Hat Filter : \sigma = 1.8 (5 \times 5)');