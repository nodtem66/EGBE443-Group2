clear; close all; clc;
pic_rgb = imread('../project8/rose.jpg');
info_rgb = imfinfo('../project8/rose.jpg');
pic = rgb2gray(pic_rgb);
maxVal = 2^(info_rgb.BitDepth/3);

pic_move = myWindow(5, pic);
pic_unsharp = double(pic) - pic_move;
pic_show = double(pic) + pic_unsharp;
subplot(311), imshow(pic_move, [0 maxVal-1]); 
subplot(312), imshow(pic_unsharp, [0 maxVal-1]); 
subplot(313), imshow(pic_show, [0 maxVal-1]); 