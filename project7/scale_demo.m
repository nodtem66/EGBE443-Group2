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
o = myFilter_old(0,-1,5,pic_n);
imshow(o, []);title('Noisy Real Image with Scale : -1');
subplot(2,3,5);
g = myFilter_old(0,0.5,5,pic_n);
imshow(g, []);title('Noisy Real Image with Scale : 0.5');
subplot(2,3,6);
h = myFilter_old(0,2,5,pic_n);
imshow(h, []);title('Noisy Real Image with Scale : 2');