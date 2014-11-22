clear; close all; clc;
%%
addpath(genpath('../Morphological/LSM file/lsm'))
pic = mylsm_v1('Cntrl1.lsm');
pic = im2bw(pic,0.16);
%% Change mask over here
% mask = createCircle(2);     maskname = 'with Circle mask';
% mask = createSquare(3);     maskname = 'with Square mask';
% mask = createDonut(3,1);    maskname = 'with Donut mask';
mask = createDaimon(3);     maskname = 'with Daimon mask';
% mask = createLine(6,135);   maskname = 'with Line mask';
%%
newIm = myErosion(pic,mask);  
mtIm = imerode(pic,mask);
%%
figure(1)
subplot(131), imshow(pic,[]), title('BW Original Pic')
subplot(132), imshow(newIm,[]), title({'My Erosion Function';maskname})
subplot(133), imshow(mtIm,[]), title({'MATLAB Erosion Function';maskname})