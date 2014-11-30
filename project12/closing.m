function fe = closing(img, H, isUseBWMorph)
if nargin == 1
    isUseBWMorph = true;
elseif nargin == 2
    isUseBWMorph = false;
end

if isUseBWMorph
    fe = bwmorph(img,'close');
else
% Dilate
fd = conv2(double(img), H', 'same');
% Erose
fe = double(~conv2(double(~fd), H', 'same'));
end