clear; close; clc;
img = imread('coins.png');
img = double(im2bw(img, 0.5));
imshow(img);

H = double(getnhood(strel('disk', 3, 0)));

[M N] = size(img);
PAD_SIZE = (size(H)-1)/2;
m = PAD_SIZE(1);
n = PAD_SIZE(2);
img0 = padarray(img, PAD_SIZE);
final = zeros(size(img0));
SUM_H = sum(sum(H));
for i = 1+m:M+m
    for j = 1+n:N+n
        d = img0(i-m:i+m,j-n:j+n);
        if SUM_H == (H(:)' * d(:))
            final(i,j) = 1;
        end
    end
end
final = final(1+m:end-m, 1+n:end-n);

figure, imshow(final);
figure, imshow(imerode(img, H));