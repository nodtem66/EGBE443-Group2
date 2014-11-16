function [Lxy newIm] = myLaplaceSharping(pic)
%%
pic = double(pic);
maskXY = [0 1 0; 1 -4 1; 0 1 0];
Lxy = conv2(pic,maskXY);
pic = padarray(pic,[1 1]);
newIm = pic-Lxy;
newIm = pic+newIm;
n = round(max(newIm(:))/255);
newIm = newIm/n;
newIm = uint8(newIm);

