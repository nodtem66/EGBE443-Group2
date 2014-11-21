function [Sx Sy magS angleS] = mySobel(pic)
%%
pic = double(pic);
% pic = padarray(pic,[1 1]);
[m n] = size(pic);
maskX = [-1 0 1; -2 0 2; -1 0 1];
maskY = [-1 -2 -1; 0 0 0; 1 2 1];
Sx = conv2(pic,maskX);
Sy = conv2(pic,maskY);
%%
magS = sqrt(Sx.^2+Sy.^2);
radX = (pi.*Sx)/180;
radY = (pi.*Sy)/180;
angleS = atan2(radY,radX);