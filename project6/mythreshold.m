function [ img ] = mytheshold( I , a, b)
    img = double(I);
    L = 2 ^ nextpow2 (max(img(:)));
    index = I >= a;
    index = I(index) <= b;
    img(:) = 0;
    img(index) = L;
    img = uint8(img);
end

