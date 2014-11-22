clear all
clc
close all
%%
info = dicominfo('dicom.dcm'); 
Y = dicomread(info);
data = myBW(Y);
%%
figure(1)
imshow(Y);
figure(2)
bar(data(:,1),data(:,2));
