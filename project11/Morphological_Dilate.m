close all
clear all
clc
%%
pic = imread('coins.png');
pic = im2bw(pic);

% mask = createCircle(5);     maskname = 'with Circle mask';
% mask = createSquare(5);     maskname = 'with Square mask';
% mask = createDonut(15,7);   maskname = 'with Donut mask';
mask = createDiamond(3);     maskname = 'with Diamond mask';
% mask = createLine(8,135);   maskname = 'with Line mask';

newIm = myDilation(pic,mask); 
mt = imdilate(pic,mask);
%%
subplot(131), imshow(pic,[]), title('Original')
subplot(132), imshow(newIm,[]), title({'My Dilation Function';maskname})
subplot(133), imshow(mt,[]), title({'MATLAB Dilation Function';maskname})