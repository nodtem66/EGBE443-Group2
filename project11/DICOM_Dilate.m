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

newIm = myDilation(pic,mask); 
mt = imdilate(pic,mask);
%%
subplot(131), imshow(pic,[]), title('Original')
subplot(132), imshow(newIm,[]), title({'My Dilation Function';maskname})
subplot(133), imshow(mt,[]), title({'MATLAB Dilation Function';maskname})
