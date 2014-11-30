clear; close all; clc;
clear; close; clc;
%img = imread('saturn.png');
img = imread('coins.png');
img = double(im2bw(img, 0.3));
%img = imread('text.png');

neighborhood_4 = createDiamond(1);
neighborhood_8 = ones(3);
B = [
    0 0 1 0 0;
    0 1 1 1 0;
    1 1 1 1 1;
    0 1 1 1 0;
    0 0 1 0 0
    ];


% A erose B
Ferose = double(~conv2(double(~img), B, 'same'));
% Sk = (A erose B) - (A erose B) o B
%S = setdiff(Ferose, opening(Ferose, B));
S = Ferose - opening(Ferose, B);

while sum(Ferose(:)) > 0
    Ferose = double(~conv2(double(~Ferose), B, 'same'));
    %Sk = xor(Ferose, opening(Ferose, B));
    Sk = Ferose - opening(Ferose, B);
    S = S | Sk;
end
%S = closing(S, B);

figure, imshow(img);
figure, imshow(S);
figure, imshow(bwmorph(img, 'skel', Inf));

