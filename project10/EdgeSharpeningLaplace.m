clear all
close all
clc
%%
% addpath(genpath('../Edge detection/Original photo'))
FileName = 'moon.jpg';
pic = imread(FileName);
pic = rgb2gray(pic);
[Lxy newIm] = myLaplaceSharping(pic);
%%
figure(1)
subplot(1,2,1); imshow(pic,[]);
subplot(1,2,2); imshow(newIm,[]);


