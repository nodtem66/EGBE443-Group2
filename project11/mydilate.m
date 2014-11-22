function [ img ] = mydilate( img, H, useConv2)
%MYDILATE (img,H, useConv2) 
%  img is 2-D vector   
%  H is Structure Element
%  useConv2=false use conv2 instead direct for-loop iteration
%  return double(img)
if nargin == 2
    useConv2 = false;
end

if strcmp(class(H), 'strel')
    H = getnhood(H);
end

img = double(img);

if useConv2
    img = conv2(img, H.', 'same');
else
    [M N] = size(img);

    PAD_SIZE = (size(H) - 1)/2;
    m = PAD_SIZE(1);
    n = PAD_SIZE(2);
    img = padarray(img, PAD_SIZE);
    final_img2 = zeros(size(img));
    for i = 1+m:M+m
        for j = 1+n:N+n
            if img(i,j) == 1
                final_img2(i-m:i+m,j-n:j+n) = final_img2(i-m:i+m,j-n:j+n) | (img(i-m:i+m,j-n:j+n) | H);
            end
        end
    end
    img = final_img2(1+m:end-m, 1+n:end-n);
end
end

