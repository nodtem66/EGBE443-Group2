clear all
clc
close all
%%
info = dicominfo('dicom.dcm'); 
picorig = dicomread(info);
pic = im2bw(picorig,0.75);
%%
mask = createCircle(5);     maskname = 'with Circle mask';
% mask = createSquare(5);     maskname = 'with Square mask';
% mask = createDonut(4,1);    maskname = 'with Donut mask';
% mask = createDaimon(5);     maskname = 'with Daimon mask';

Im1 = myOpening(pic,mask);
Im2 = myClosing(pic,mask);
%%
subplot(221), imshow(picorig), title('Original')
subplot(222), imshow(pic,[]), title('BW Original Pic')
subplot(223), imshow(Im1,[]), title({'Opening';maskname})
subplot(224), imshow(Im2,[]), title({'Closing';maskname})
