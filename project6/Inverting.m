clc
clear all

pic_rgb = imread('Print.jpg');
pic_gray = rgb2gray(pic_rgb);
pic_test = pic_gray;

pic_gray = 255 - pic_gray;

subplot(3,2,1), imshow(pic_rgb);
title('RGB Image');

subplot(3,2,2), show_rgb = myBW(pic_rgb);
bar(show_rgb),xlim([0 255])
title('RGB Histogram');

subplot(3,2,3), imshow(pic_test);
title('Gray Image');

subplot(3,2,4), show_test = myBW(pic_test);
bar(show_test), xlim([0 255])
title('Gray Histogram');

subplot(3,2,5), imshow(pic_gray);
title('Inverting Image');

subplot(3,2,6), show_gray = myBW(pic_gray);
bar(show_gray), xlim([0 255])
title('Inverting Histogram');