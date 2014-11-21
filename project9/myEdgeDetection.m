function [x y mag angle] = myEdgeDetection(name,pic)
%%
if strcmp(name,'g')
    [x y mag angle] = myGradient(pic);
elseif strcmp(name,'p')
    [x y mag angle] = myPrewitt(pic);
elseif strcmp(name,'s')
    [x y mag angle] = mySobel(pic);
else
    disp('Error !!!')
end
