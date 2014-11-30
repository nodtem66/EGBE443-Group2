clear; close; clc;
clear; close; clc;
img = imread('saturn.png');
img = double(im2bw(img, 0.3));
%img = imread('text.png');

neighborhood_4 = createDiamond(1);
neighborhood_8 = createSquare(2);
% Erose
fe = double(~conv2(double(~img), neighborhood_4, 'same'));
Foutline = xor(img, fe);
Fskeleton = Foutline;

Ferose = double(~conv2(double(~Fskeleton), neighborhood_4, 'same'));
while max(max(Ferose)) ~= 0 
    Fskeleton = Ferose;
    Ferose = double(~conv2(double(~Fskeleton), neighborhood_4, 'same'));
end

subplot('Position', [0 0.5 0.5 0.5]), imshow(img);
subplot('Position', [0.5 0.5 0.5 0.5]), imshow(fe);
subplot('Position', [0 0 0.5 0.5]), imshow(Foutline);
subplot('Position', [0.5 0 0.5 0.5]), imshow(Fskeleton);
