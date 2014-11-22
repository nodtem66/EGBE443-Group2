clear; clc; close all;
%% rgb file
pic = imread('../matlab/aaa.jpg');
pic_info = imfinfo('../matlab/aaa.jpg');
pic_n = rgb2gray(pic);
maxVal = 2^(pic_info.BitDepth/3);

%% ploting
subplot(2,3,2);
imshow(pic_n, [0 maxVal-1]);title('Real Image');
subplot(2,3,4);
o = myFilter_old(-100,1,5,pic_n);
imshow(o, [0 maxVal-1]);title('Noisy Real Image with Offset : -100');
subplot(2,3,5);
g = myFilter_old(10,1,5,pic_n);
imshow(g, [0 maxVal-1]);title('Noisy Real Image with Offset : 10');
subplot(2,3,6);
h = myFilter_old(100,1,5,pic_n);
imshow(h, [0 maxVal-1]);title('Noisy Real Image with Offset : 100');