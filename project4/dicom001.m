% first code, can show dicom and adjust contrast
info = dicominfo('PT604001002.dcm'); 
Y = dicomread(info);
figure, imshow(Y);
% imcontrast;

% second code, can show dicom and adjust figure size
% [X, map] = dicomread('PT604001002.dcm');
% montage(X, 'Size', [1 1]);