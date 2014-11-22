clc;
clear all;
close all;


%I = rgb2gray(imread('tire.jpg'));
I = dicomread('../raw_data/PT604001002.dcm');
I = uint16(I);
%I = imread('../raw_data/Cntrl1.lsm');
%I = I(:,:,1);
subplot(3,2,1);
imshow(I);
title('Original Image');

%%contrastImage = imadjust(I, [0 0.8], [0 1]);
%%figure(2);
%%imshow(contrastImage)
%%title('Contrast Image');

img_1 = myhisteq(I, 2^15);
subplot(3,2,3);
imshow(img_1);
title('myhisteq Image');

img_2 = histeq(I, 2^15);
subplot(3,2,5);
imshow(img_2);
title('histeq Image');



subplot(3,2,2);
imhist(I, 2^15);
%xlim([-10 265]);        


subplot(3,2,4);
imhist(img_1, 2^15);
%xlim([-0.1 1]);        

subplot(3,2,6);
imhist(img_2, 2^15);
%xlim([-0.1 1]);        