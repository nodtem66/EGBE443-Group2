clear; close all; clc;
%%
addpath(genpath('../Morphological/LSM file/lsm'))
pic = mylsm_v1('Cntrl1.lsm');
pic = im2bw(pic,0.16);
%% Change mask over here 
% mask = createCircle(5);     maskname = 'with Circle mask';
% mask = createSquare(5);     maskname = 'with Square mask';
% mask = createDonut(15,7);   maskname = 'with Donut mask';
mask = createDaimon(3);     maskname = 'with Daimon mask';
% mask = createLine(6,135);   maskname = 'with Line mask';
%%
newIm = myDilation(pic,mask);  
mtIm = imdilate(pic,mask);
%%
figure(1)
subplot(131), imshow(pic,[]), title('Original')
subplot(132), imshow(newIm,[]), title({'My Dilation Function';maskname})
subplot(133), imshow(mtIm,[]), title({'MATLAB Dilation Function';maskname})