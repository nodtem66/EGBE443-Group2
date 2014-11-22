function [Gx Gy magG angleG] = myGradient(pic)
%%
pic = double(pic);
pic = padarray(pic,[1 1]);
[m n] = size(pic);
% maskX = [-0.5 0 0.5];
% maskY = [-0.5; 0; 0.5;];
% Gx = conv2(pic,maskX);
% Gy = conv2(pic,maskY);
for i=2:m-1
    for j=2:n-1
        Gx(i-1,j-1) = (pic(i,j+1)-pic(i,j-1))/2;
        Gy(i-1,j-1) = (pic(i+1,j)-pic(i-1,j))/2;
    end
end
%%
magG = sqrt(Gx.^2+Gy.^2);
radX = (pi.*Gx)/180;
radY = (pi.*Gy)/180;
angleG = atan2(radY,radX);
