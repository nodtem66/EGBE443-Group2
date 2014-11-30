clear; close all; clc;

img = imread('coins.png');
img = double(im2bw(img, 0.5));


neighborhood_4 = createDiamond(1);
neighborhood_8 = ones(3);
B = neighborhood_8;

% Test opening operator
figure;
subplot('Position', [0 0 0.5 1]), imshow(opening(img, B));
subplot('Position', [0.5 0 0.5 1]), imshow(bwmorph(img,'open'));

% Test erosion
figure;
Ferose = double(~conv2(double(~img), B, 'same'));
subplot('Position', [0 0 0.5 1]), imshow(Ferose);
subplot('Position', [0.5 0 0.5 1]), imshow(bwmorph(img,'erode'));

