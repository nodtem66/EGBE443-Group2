close all
clear all
clc
%%
picName = 'raw_data/tire.jpg';
info = imfinfo(picName);
Image = rgb2gray(imread(picName));
maxVal = 2^(info.BitDepth/3);
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

%% Plot 
figure

subplot(3,2,1)
imshow(Image);
H_original = myBW(Image,maxVal);
subplot(3,2,2)
bar(H_original)
xlim([1 maxVal])

subplot(3,2,3)
imshow(uint8(NewImage));
H_myfunct = myBW(NewImage,maxVal);
subplot(3,2,4)
bar(H_myfunct);
xlim([1 maxVal])

MatlabImage = histeq(Image, 256);
subplot(3,2,5)
imshow(MatlabImage)
H_MatlabImage = myBW(MatlabImage,maxVal);
subplot(3,2,6)
bar(H_MatlabImage);
xlim([1 maxVal])

