clear all
close all
clc
%%
% addpath(genpath('../Edge detection/Original photo'))
FileName = 'moon.jpg';
pic = imread(FileName);
pic = rgb2gray(pic);
[Lxy newIm] = myLaplaceSharping(pic);

pic2 = mylsm_v1('Cntrl1.lsm');
pic2 = rgb2gray(pic2);
lsm_info = imfinfo('Cntrl1.lsm');
[Lxy1 newIm1] = myLaplaceSharping(pic2);

pic3 = dicomread('dicom.dcm');
[Lxy2 newIm2] = myLaplaceSharping(pic3);
 %%
figure(1)
subplot(1,2,1); imshow(pic,[]); title('JPG original')
subplot(1,2,2); imshow(newIm,[]);title('JPG edge sharpening')

figure(2)
subplot(1,2,1); imshow(pic2,[]); title('LSM original')
subplot(1,2,2); imshow(newIm1,[]);title('LSM edge sharpening')

figure(3)
subplot(1,2,1); imshow(pic3,[]); title('DICOM original')
subplot(1,2,2); imshow(newIm2,[]); title('DICOM edge shapening')

