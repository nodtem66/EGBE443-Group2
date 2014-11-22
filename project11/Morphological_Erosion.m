clear all
clc
%%
pic = imread('coins.png');  
pic = im2bw(pic);

% mask = createCircle(10);        maskname = 'with Circle mask';   
% mask = createSquare(5);         maskname = 'with Square mask'; 
% mask = createDonut(15,7);       maskname = 'with Donut mask';
mask = createDiamond(3);     maskname = 'with Diamond mask';
% mask = createLine(8,135);       maskname = 'with Line mask';

newIm = myErosion(pic,mask);
erodedBW = imerode(pic,mask);
%%
subplot(131), imshow(pic,[]), title('BW Original Pic')
subplot(132), imshow(erodedBW,[]), title({'My Erosion Function';maskname})
subplot(133), imshow(newIm,[]), title({'MATLAB Erosion Function';maskname})


