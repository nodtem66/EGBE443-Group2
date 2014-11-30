clear all
clc
close all
%%
info = dicominfo('dicom.dcm'); 
pic = dicomread(info);
pic = im2bw(pic,0.7);

newIm = mySkeleton(pic);

subplot(131), imshow(pic), title('Original image')
subplot(132), imshow(newIm), title('My function')
subplot(133), imshow(bwmorph(im2bw(pic),'skel','Inf')), title('MATLAB function')
