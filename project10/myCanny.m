function img = myCanny(img, low, high, isInRange)
sizeImg = size(img);

if nargin == 1
    low = 0.075;
    high = 0.175;
    isInRange = @(x) (x >= high);
elseif nargin == 2
    high = 2*low;
    isInRange = @(x) (x >= high);
elseif nargin == 3
    isInRange = @(x) (x >= high);
end

%Convert to Grayscale image
if (length(sizeImg) > 2)
    img = rgb2gray(img);
end
img = double(img);

%define dimention of image
M = sizeImg(1);
N = sizeImg(2);

%%Define a gaussian function

%%%% gaussian_f = @(sigma) (@(x,y) ((exp(-(x.^2 + y.^ 2) ./ ( 2 .* (sigma .^ 2))))));
%%%% window_filter(gaussian_f(1), [5 5])
gaussian_filter = [
    0.0030 0.0133 0.0219 0.0133 0.0030;
    0.0133 0.0596 0.0983 0.0596 0.0133;
    0.0219 0.0983 0.1621 0.0983 0.0219;
    0.0133 0.0596 0.0983 0.0596 0.0133;
    0.0030 0.0133 0.0219 0.0133 0.0030
];

% Blur image with gaussian filter
img = conv2(img, gaussian_filter, 'same');

%Define sobel operation
sobel_x = [
    -1 0 1;
    -2 0 2;
    -1 0 1;
];
sobel_y = [
    1 2 1;
    0 0 0;
    -1 -2 -1
];
% Edge finding via Sobel Operation
img_x = conv2(img, sobel_x, 'same');
img_y = conv2(img, sobel_y, 'same');

%Calculate magnitude
magnitude = sqrt(img_x.^2 + img_y.^2);

% find direction/orientation
direction = atan2(img_y,img_x) * 180 / pi;
direction(direction < 0) = direction(direction < 0) + 360;

%Adjust direction to nearest 0 45 90 135
for i = 1:M
    for j = 1:N
        d = direction(i,j);
        if (d >=0 && d < 22.5) || (d >= 157.5 && d < 202.5) || (d >= 337.5 && d <= 360) 
            direction(i,j) = 0;
        elseif (d >= 22.5 && d < 67.5) || (d >= 202.5 && d < 247.5)
            direction(i,j) = 45; 
        elseif (d >= 67.5 && d < 112.5) || (d >= 247.5 && d < 292.5)
            direction(i,j) = 90;
        elseif (d >= 112.5 && d < 157.5) || (d >= 292.5 && d < 337.5)
            direction(i,j) = 135;
        end
    end
end

%Non-Maximum Supression
BW = zeros(M,N);
for i = 2:M-1
    for j = 2:N-1
        if (direction(i,j) == 0) 
            BW(i,j) = (magnitude(i,j) == max(magnitude(i,j-1:j+1)));
        elseif (direction(i,j) == 45) 
            BW(i,j) = (magnitude(i,j) == max([magnitude(i,j), magnitude(i+1,j-1), magnitude(i-1,j+1)]));
        elseif (direction(i,j) == 90)
            BW(i,j) = (magnitude(i,j) == max(magnitude(i-1:i+1,j)));
        elseif (direction(i,j) == 135) 
            BW(i,j) = (magnitude(i,j) == max([magnitude(i,j), magnitude(i+1,j+1), magnitude(i-1,j-1)]));
        end
    end
end
BW = BW.* magnitude;
%figure, imshow(BW);

%% Hysteresis Thresholding

maxvalue = max(max(BW));
low = low * maxvalue;
high = high * maxvalue;
% define helper function
%isInRange = @(x) ((center - delta <= x) & (x <= center + delta));
%isInRange = @(x) ((low <= x) & (x <= high));
%isInRange = @(x) (low <= x);

img = zeros(size(img));
for i = 1:M
    for j = 1:N
        
        %Using 8-connected components
        start_i = i-1;
        end_i = i+1;
        start_j = j-1;
        end_j = j+1;
        
        % for Edge of image, use 5-connected components
        if i == 1
            start_i = i;
        elseif i == M
            end_i = j;
        end
        if j == 1
            start_j = j;
        elseif j == N
            end_j = j;
        end
        if BW(i,j) < low
            img(i,j) = 0;
        elseif BW(i,j) >= high
            img(i,j) = 1;
        elseif any(isInRange(BW(start_i:end_i,start_j:end_j)))
            img(i,j) = 1;
        end
    end
end
%figure, imshow(img);
end