clear all
close all
clc
%%
% addpath(genpath('../Edge detection/Original photo'))

info = dicominfo('C:\Users\PINGGA\Desktop\PT604001002.dcm'); 
pic = dicomread(info);

[Lxy newIm] = myLaplaceSharping(pic);
%%
figure(1)
subplot(1,2,1); imshow(pic,[]);
subplot(1,2,2); imshow(newIm,[]);