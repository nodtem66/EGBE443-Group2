clear; close; clc;
img = imread('coins.png');
img = im2bw(img, 0.7);

H = getnhood(strel('disk', 2));

I1 = mydilate(img, H);
I2 = imdilate(img, H);
subplot('Position', [0 0 0.33 1]), imshow(img);
subplot('Position', [0.335 0 0.33 1]), imshow(I1);
subplot('Position', [0.67 0 0.33 1]), imshow(I2);
fprintf('Error: %d\n', sum(sum(I1-I2)));