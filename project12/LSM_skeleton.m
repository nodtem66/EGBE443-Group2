clear; close all; clc;
%%
addpath(genpath('../Morphological/LSM file/lsm'))
pic = mylsm_v1('Cntrl1.lsm');
pic = im2bw(pic,0.09);
newIm = mySkeleton(pic);

subplot(131), imshow(pic), title('Original image')
subplot(132), imshow(newIm), title('My function')
subplot(133), imshow(bwmorph(im2bw(pic),'skel','Inf')), title('MATLAB function')