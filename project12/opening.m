function fd = opening(img, H, isUseBWMorph)

if nargin == 1
    isUseBWMorph = true;
elseif nargin == 2
    isUseBWMorph = false;
end

if isUseBWMorph
    fd = bwmorph(img,'open');
else
    % Erose
    fe = double(~conv2(double(~img), H', 'same'));
    % Dilate
    fd = conv2(fe, H, 'same');
end

end