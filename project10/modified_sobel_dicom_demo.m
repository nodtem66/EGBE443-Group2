clear; clc; close all;
%% DICOM
f0 = dicomread('../raw_data/PT604001002.dcm');
f = modified_sobel(f0);
threshold = 6000;
f(f>threshold) = 32768;
f(f<threshold) = 0;
subplot('Position', [0 0 0.5 1]), imshow(f0, [0 32768]);
subplot('Position', [0.5 0 0.5 1]), imshow(f, [0 32768]);

%% JPG
f0 = imread('../raw_data/print.jpg');
f = modified_sobel(f0);
threshold = 130;
f(f>threshold) = 255;
f(f<threshold) = 0;
subplot('Position', [0 0 0.5 1]), imshow(f0);
subplot('Position', [0.5 0 0.5 1]), imshow(f);

%% LSM
f0 = mylsm('../raw_data/Cntrl1.lsm');
f0 = f0.tiff_rawdata;
f = modified_sobel(f0);
threshold = 40;
f(f>threshold) = 255;
f(f<threshold) = 0;
subplot('Position', [0 0 0.5 1]), imshow(f0);
subplot('Position', [0.5 0 0.5 1]), imshow(f);