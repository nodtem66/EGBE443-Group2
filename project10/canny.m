clear all
close all
clc
%%
% addpath(genpath('../Edge detection/Original photo'))
FileName = 'ex.jpg';
pic = imread(FileName);
pic = rgb2gray(pic);
%%
[newIm sumVal thSum] = myCanny(pic,100);
imshow(newIm,[]);