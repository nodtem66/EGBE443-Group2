clear; close all; clc;
%img = imread('coins.png');
%img = double(im2bw(img, 0.7));
img = [
    0 0 0 1;
    0 1 0 0;
    0 0 0 1;
    0 0 0 1
];
[M N] = size(img);

% Structure element: Disk size 1
H = double(getnhood(strel('disk', 1)));

% Use conv2
tic;
final_img = conv2(img, H.', 'same');
toc

% Use Manual Loop
PAD_SIZE = (size(H) - 1)/2;
m = PAD_SIZE(1);
n = PAD_SIZE(2);
tic;
final_img2 = zeros(M+2*m+1,N+2*n+1);
img_0 = padarray(img, PAD_SIZE);
for i = 1+m:M+m
    for j = 1+n:N+n
        if img_0(i,j) == 1
            final_img2(i-m:i+m,j-n:j+n) = final_img2(i-m:i+m,j-n:j+n) | (img_0(i-m:i+m,j-n:j+n) | H.');
        end
    end
end
final_img2 = final_img2(1+m:end-m-1, 1+n:end-n-1);
toc

% Use IMDILATE
tic;
final_img3 = imdilate(img, H);
toc;

figure;
subplot('Position', [0 0.5 0.5 0.5]), imshow(img);
subplot('Position', [0.5 0.5 0.5 0.5]), imshow(final_img);
subplot('Position', [0 0 0.5 0.5]), imshow(final_img2);
subplot('Position', [0.5 0 0.5 0.5]), imshow(final_img3);
