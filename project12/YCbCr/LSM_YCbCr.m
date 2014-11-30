clear; close all; clc;
%%
addpath(genpath('../Color Image/LSM file/lsm'))
rgb = mylsm_v1('Cntrl1.lsm');
%%
newpic = myYCbCr(rgb);
YCBCR = rgb2ycbcr(rgb);
%%
subplot(121), imshow(newpic), title('My function')
subplot(122), imshow(YCBCR), title('MATLAB function')