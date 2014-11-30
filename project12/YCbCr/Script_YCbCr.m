close all
clear all
clc
%%
rgb = imread('Lhon.jpg');
newpic = myYCbCr(rgb);
YCBCR = rgb2ycbcr(rgb);

subplot(121), imshow(newpic), title('My function')
subplot(122), imshow(YCBCR), title('MATLAB function')
