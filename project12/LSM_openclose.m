clear; close all; clc;
%%
addpath(genpath('../Morphological/LSM file/lsm'))
pic_orig = mylsm_v1('Cntrl1.lsm');
pic = im2bw(pic_orig,0.16);
%% Change mask over here
% mask = createCircle(2);     maskname = 'with Circle mask';
% mask = createSquare(3);     maskname = 'with Square mask';
% mask = createDonut(3,1);    maskname = 'with Donut mask';
mask = createDaimon(3);     maskname = 'with Daimon mask';
%%
Im1 = myOpening(pic,mask);  
Im2 = myClosing(pic,mask);
%%
figure(1)
subplot(221), imshow(pic_orig), title('Original')
subplot(222), imshow(pic,[]), title('BW Pic')
subplot(223), imshow(Im1,[]), title({'Opening';maskname})
subplot(224), imshow(Im2,[]), title({'Closing';maskname})