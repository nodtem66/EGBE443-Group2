clc;
clear all;
close all;

I = rgb2gray(imread('Ting.jpg'));
subplot(3,2,1);
imshow(I);
title('Original Image');

%%contrastImage = imadjust(I, [0 0.8], [0 1]);
%%figure(2);
%%imshow(contrastImage)
%%title('Contrast Image');

img_1 = myhisteq(I);
subplot(3,2,3);
imshow(img_1);
title('myhisteq Image');

img_2 = histeq(I, 256);
subplot(3,2,5);
imshow(img_2);
title('histeq Image');



subplot(3,2,2);
imhist(I);
%xlim([-10 265]);        
ylim([0 10000]);


subplot(3,2,4);
imhist(img_1);
%xlim([-0.1 1]);        
ylim([0 10000]);

subplot(3,2,6);
imhist(img_2);
%xlim([-0.1 1]);        
ylim([0 10000]);