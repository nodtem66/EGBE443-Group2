function label = myCanny2(img, threshold, length_line_threshold, useBWLABEL)

if nargin == 1
    threshold = 0.075;
    length_line_threshold = 20;
    useBWLABEL = false;
elseif nargin == 2
    length_line_threshold = 20;
    useBWLABEL = false;
elseif nargin == 3
    useBWLABEL = false;
end

sizeImg = size(img);

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
BW = BW.*magnitude;
%Threshold maginitude
maxBW = max(max(BW));
BW(BW < threshold * maxBW) = 0;

% Connected-component Labelling
% Two Pass algorithm from wikipedia
% http://en.wikipedia.org/wiki/Connected-component_labeling
if useBWLABEL
[label nextLabel] = bwlabel(BW);
else
label = zeros(M,N);
% helper function
isInRange = @(x) (x >= 0.175 * maxBW);

% union-find data structure
myUFInit(floor(M*N/4));

% OnePass
nextLabel = 1;
for i = 1:M
    for j = 1:N
        % If data is not background
        if isInRange(BW(i,j))
            if i==1
                % ignore north direction connected component
                if j==1
                    label(i,j) = nextLabel;
                    nextLabel = nextLabel + 1;
                else
                    % scan a neighborhood (west)
                    if label(i, j-1) == 0
                        label(i,j) = nextLabel;
                        nextLabel = nextLabel + 1;
                    else
                        label(i,j) = myUFfind(label(i,j-1));
                        myUFunion(label(i,j), label(i,j-1));
                    end
                end
            elseif j==1
                % ignore west direction connected component
                
                % scan 2 neighborhood (north northeast)
                neighbor = [label(i-1, j) label(i-1, j+1)];
                neighbor = neighbor(neighbor>0);
                
                % label current position
                if isempty(neighbor)
                    label(i,j) = nextLabel;
                    nextLabel = nextLabel + 1;
                else
                    label(i,j) = min(neighbor);
                    for k = 1:length(neighbor)-1
                        myUFunion(neighbor(k), neighbor(k+1));
                    end
                end
            else    
                % Using 8 connected components
                
                % scan 4 neighborhood (w nw n ne)
                neighbor = [label(i,j-1)
                            label(i-1,j-1)
                            label(i-1, j)
                            label(i-1, j+1)];
                neighbor = neighbor(neighbor>0);

                % label current position
                if isempty(neighbor)
                    label(i,j) = nextLabel;
                    nextLabel = nextLabel + 1;
                else
                    label(i,j) = min(neighbor);
                    for k = 1:length(neighbor)-1
                        myUFunion(neighbor(k), neighbor(k+1));
                    end
                end
            end
        end
    end
end

%TwoPass
for i = 1:M
    for j = 1:N
        if (label(i,j) ~= 0)
            label(i,j) = myUFfind(label(i,j));
        end
    end
end
end

% Histogram of label
for i = 1:nextLabel
    if (length(find(label==i)) < length_line_threshold)
        label(label==i) = 0;
    end
end
end