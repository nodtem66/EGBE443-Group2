clear all
clc
%%
pic = imread('coins.png');
pic = im2bw(pic);

% mask = createCircle(10);        maskname = 'with Circle mask';   
% mask = createSquare(5);         maskname = 'with Square mask'; 
% mask = createDonut(8,4);       maskname = 'with Donut mask';
mask = createDaimon(9);         maskname = 'with Daimon mask';

Open_pic = myOpening(pic,mask);
Close_pic = myClosing(pic,mask);

subplot(2,2,[1 2]), imshow(pic), title('Original')
subplot(2,2,3), imshow(Open_pic), title({'Opening';maskname})
subplot(2,2,4), imshow(Close_pic), title({'Closing';maskname})