clear all
clc
close all
%%
info = dicominfo('dicom.dcm'); 
pic = dicomread(info);
pic = im2bw(pic,0.7);
%%
% mask = createCircle(5);     maskname = 'with Circle mask';
% mask = createSquare(5);     maskname = 'with Square mask';
% mask = createDonut(4,1);    maskname = 'with Donut mask';
mask = createDaimon(3);     maskname = 'with Daimon mask';
% mask = createLine(8,135);   maskname = 'with Line mask';

newIm = myErosion(pic,mask);
erodedBW = imerode(pic,mask);
%%
subplot(131), imshow(pic,[]), title('BW Original Pic')
subplot(132), imshow(erodedBW,[]), title({'My Erosion Function';maskname})
subplot(133), imshow(newIm,[]), title({'MATLAB Erosion Function';maskname})
