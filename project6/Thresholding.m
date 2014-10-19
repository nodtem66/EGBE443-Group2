clc
clear all

pic_rgb = imread('T002.jpg');
pic_gray = rgb2gray(pic_rgb);
subplot(2,1,1), imshow(pic_rgb);
title('Real Image');

[pic_x pic_y layer] = size(pic_rgb);

data_r = pic_rgb(:,:,1);
data_g = pic_rgb(:,:,2);
data_b = pic_rgb(:,:,3);

for i = 1:pic_x
    for j = 1:pic_y
       if (data_r(i,j,:)>80) && (data_r(i,j,:)<200) && (data_g(i,j,:)>50) && (data_g(i,j,:)<150) && (data_b(i,j,:)>50) && (data_b(i,j,:)<100)
           pic_gray(i,j,1) = 255;
        else
           pic_gray(i,j,1) = 0;
        end
    end
end

subplot(2,1,2), imshow(pic_gray);
title('Thresholding Image');