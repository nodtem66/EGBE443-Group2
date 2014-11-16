%clear; close all; clc;
%f = imread('../raw_data/print.jpg');
function E = modified_sobel(f)

CLASS = class(f);
if length(size(f)) > 2
    f = rgb2gray(f);
end
f = double(f);
H0 = [-1 0 1; -2 0 2; -1 0 1];
H1 = [-2 -1 0; -1 0 1; 0 1 2];
H2 = [-1 -2 -1; 0 0 0; 1 2 1];
H3 = [0 -1 -2; 1 0 -1; 2 1 0];
d0 = conv2(f, H0, 'same');
d1 = conv2(f, H1, 'same');
d2 = conv2(f, H2, 'same');
d3 = conv2(f, H3, 'same');

E = [d0(:)' ; d1(:)' ; d2(:)' ; d3(:)'];
E = max(abs(E), [], 1);
E = reshape(E, size(f));

if strcmp(CLASS, 'uint8')
    E = uint8(E);
end

end
