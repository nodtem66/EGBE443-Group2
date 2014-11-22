clear all
clc
close all
%%
addpath(genpath('../Point operations/Original photo'))
Y = rgb2gray(imread('Parn.jpg'));

value = 2;
pic_1 = Y;
pic_2 = setContrast(Y,value,1);
pic_3 = setContrast(Y,value,2);
%%

subplot(3,2,1)
imshow(pic_1)
title('Original : Grey scale image')
subplot(3,2,2)
data_A = myBW(pic_1);
bar(data_A)
title('Histogram : original image')
xlim([0 255])

subplot(3,2,3)
imshow(pic_2)
title('Add : Grey scale image')
subplot(3,2,4)
data_B = myBW(pic_2);
bar(data_B)
title('Histogram : add image')
xlim([0 255])

subplot(3,2,5)
imshow(pic_3)
title('Multiply : Grey scale image')
subplot(3,2,6)
data_C = myBW(pic_3);
bar(data_C)
title('Histogram : multiply image')
xlim([0 255])


