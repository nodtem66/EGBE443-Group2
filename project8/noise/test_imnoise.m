clear; clc; close all;
pic = imread('../project8/cat.jpg');
%% Show RGB Image
subplot(2,2,1);
imshow(pic);title('Real Image');
pic_g = imnoise(pic, 'gaussian');
subplot(2,2,2);
imshow(pic_g);title('Real Image with Gaussian Noise');
pic_p = imnoise(pic, 'poisson');
subplot(2,2,3);
imshow(pic_p);title('Real Image with Poisson Noise');
pic_sp = imnoise(pic, 'salt & pepper');
subplot(2,2,4);
imshow(pic_sp);title('Real Image with Salt&Pepper Noise');
%% Show Gray Image
figure
subplot(2,2,1);
imshow(rgb2gray(pic));title('Gray Image');
pic_g = imnoise(pic, 'gaussian');
subplot(2,2,2);
imshow(rgb2gray(pic_g));title('Gray Image with Gaussian Noise');
pic_p = imnoise(pic, 'poisson');
subplot(2,2,3);
imshow(rgb2gray(pic_p));title('Gray Image with Poisson Noise');
pic_sp = imnoise(pic, 'salt & pepper');
subplot(2,2,4);
imshow(rgb2gray(pic_sp));title('Gray Image with Salt&Pepper Noise');