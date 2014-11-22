clc
clear all

I = rgb2gray(imread('Print.jpg'))
subplot(1,4,1);
imshow(I)
title('Original Image');

%%contrastImage = imadjust(I, [0 0.8], [0 1]);
%%figure(2);
%%imshow(contrastImage)
%%title('Contrast Image');

img_contrast = (-cos(pi * mat2gray(I))+1)/2;
subplot(1,4,2);
imshow(img_contrast)
title('Contrast Image');


subplot(1,4,3);
imhist(I);
xlim([-10 265]);        
ylim([0 10000]);
title('Original Image Histogram');


subplot(1,4,4);
imhist(img_contrast);
xlim([-0.1 1]);        
ylim([0 10000]);
title('Contrast Image Histogram');