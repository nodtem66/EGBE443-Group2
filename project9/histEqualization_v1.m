function [NewImage Image maxVal] = histEqualization_v1(picName)
% info = imfinfo(picName);
% Image = rgb2gray(imread(picName));
% maxVal = 2^(info.BitDepth/3);
% Image = rgb2gray(imread(picName));
Image = picName;
maxVal = 256;
nPix = size(Image,1)*size(Image,2);
%% Count number of each value
setDat = zeros(maxVal,2);
for i=1:size(Image,1) 
    for j=1:size(Image,2) 
        setDat(Image(i,j)+1,1) = setDat(Image(i,j)+1,1)+1;
    end
end
%% Find the cumulative
sum = 0;
for i=1:maxVal
    sum = sum+setDat(i,1);
    setDat(i,2) = sum;
end
%% Get output
output = zeros(maxVal,1);
for i=1:maxVal
    output(i,1) = round(setDat(i,2)/nPix*(maxVal-1));
end
%% Get a new pic
for i=1:size(Image,1) 
    for j=1:size(Image,2) 
        pixVal = Image(i,j)+1;
        NewImage(i,j) = output(pixVal,1);
    end
end