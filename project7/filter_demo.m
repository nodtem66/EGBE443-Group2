clear; clc; close all;
f = imread('../raw_data/Print.jpg');
%f = imnoise(f, 'salt & pepper');
f = rgb2gray(f);

gaussian_f = @(sigma) (@(x,y) ((exp(-(x.^2 + y.^ 2) ./ ( 2 .* (sigma .^ 2))))));
maxican_hat_f = @(sigma) (@(x,y) ((2/(sqrt(3*sigma)*pi^0.25)) .* (1-(x.^2+y.^2)/sigma^2) .* exp(-1/2 .* (x.^2+y.^2)/sigma^2)));
moving_avg_f = @(x,y) (ones(size(x)));
N = 2;
i = 1;

subplot('Position',[0 0 0.5 1]), imshow(f);
%g = window_filter(double(f), maxican_hat_f(1.8), [5 5], true);
%g = window_filter(double(f), gaussian_f(6), [5 5], true);
g = window_filter(double(f), moving_avg_f, [8 8], true);
subplot('Position',[0.5 0 0.5 1]), imshow(uint8(g));