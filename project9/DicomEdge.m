clear all
close all
clc
%%
info = dicominfo('dicom.dcm'); 
pic = dicomread(info);
%% My function
[Gx Gy magG angleG] = myEdgeDetection('g',pic);
[Px Py magP angleP] = myEdgeDetection('p',pic);
[Sx Sy magS angleS] = myEdgeDetection('s',pic);
%% MATLAB function
[MGx, MGy] = imgradientxy(pic,'CentralDifference');     [MmagG, MangleG] = imgradient(MGx, MGy);
[MPx, MPy] = imgradientxy(pic,'Prewitt');               [MmagP, MangleP] = imgradient(MPx, MPy);
[MSx, MSy] = imgradientxy(pic,'Sobel');                 [MmagS, MangleS] = imgradient(MSx, MSy);
%%
figure(1)
subplot(3,3,2), imshow(pic,[]), title('Original')
subplot(3,2,3), imshowpair(Gx, MGx,'montage'), title('Gx: My code and MATLAB function');
subplot(3,2,4), imshowpair(Gy, MGy,'montage'), title('Gy: My code and MATLAB function');
subplot(3,2,5), imshowpair(magG,MmagG,'montage'), title('Gradient Magnitude: My code and MATLAB function');
subplot(3,2,6), imshowpair(angleG,MangleG,'montage'), title('Gradient Direction: My code and MATLAB function');

figure(2)
subplot(3,3,2), imshow(pic,[]), title('Original')
subplot(3,2,3), imshowpair(Px,MPx, 'montage'), title('Px: My code and MATLAB function');
subplot(3,2,4), imshowpair(Py,MPy, 'montage'), title('Py: My code and MATLAB function');
subplot(3,2,5), imshowpair(magP, MmagP, 'montage'), title('Perwitt Magnitude: My code and MATLAB function');
subplot(3,2,6), imshowpair(angleP, MangleP, 'montage'), title('Perwitt Derection: My code and MATLAB function');

figure(3)
subplot(3,3,2), imshow(pic,[]), title('Original')
subplot(3,2,3), imshowpair(Sx,MSx, 'montage'), title('Sx: My code and MATLAB function');
subplot(3,2,4), imshowpair(Sy,MSy, 'montage'), title('Sy: My code and MATLAB function');
subplot(3,2,5), imshowpair(magS,MmagS, 'montage'), title('Sobel Magnitude: My code and MATLAB function');
subplot(3,2,6), imshowpair(angleS,MangleS, 'montage'), title('Sobel Direction: My code and MATLAB function');


