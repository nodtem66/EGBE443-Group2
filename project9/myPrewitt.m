function [Px Py magP angleP] = myPrewitt(pic)
%%
pic = double(pic);
% pic = padarray(pic,[1 1]);
[m n] = size(pic);
maskX = [-1 0 1; -1 0 1; -1 0 1];
maskY = [-1 -1 -1; 0 0 0; 1 1 1];
Px = conv2(pic,maskX);
Py = conv2(pic,maskY);
%%
magP = sqrt(Px.^2+Py.^2);
radX = (pi.*Px)/180;
radY = (pi.*Py)/180;
angleP = atan2(radY,radX);
