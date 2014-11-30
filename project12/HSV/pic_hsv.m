close all
clear all
clc
set(gcf,'color','white')

%%
rgbi = imread('ping_picBL.jpg');
myhsv = myrgb2hsv(rgbi);

subplot(1,3,1)
imshow(rgbi)
title('Original Image')

hsvtrue = rgb2hsv(rgbi);
subplot(1,3,2)
imshow(hsvtrue)
title('Matlab Function Image')

subplot(1,3,3)
imshow(myhsv)
title('My Function Image')

