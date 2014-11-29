clear all
clc

pic = imread('coins.png');
pic = im2bw(pic);
newIm = mySkeleton(pic);

subplot(131), imshow(pic), title('Original image')
subplot(132), imshow(newIm), title('My function')
subplot(133), imshow(bwmorph(im2bw(pic),'skel','Inf')), title('MATLAB function')

