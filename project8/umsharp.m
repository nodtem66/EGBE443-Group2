clear; close all; clc;
%% input pic
pic = imread('../project8/rose.jpg');
info_rgb = imfinfo('../project8/rose.jpg');
pic_rgb = rgb2gray(pic);
maxVal_rgb = 2^(info_rgb.BitDepth/3);

pic_lsm = mylsm('../project8/Cntrl1.lsm');
lsm_info = imfinfo('../project8/Cntrl1.lsm');
[w h] = lsm_info.BitDepth;
maxVal_lsm = 2^(h/3);

dicom_info = dicominfo('body.dcm');
pic_dicom = dicomread(dicom_info);
maxVal_dicom = 2^(dicom_info.BitDepth);
%% process pic
pic_rgb_move = myWindow(5, pic_rgb);
pic_rgb_unsharp = double(pic_rgb) - pic_rgb_move;
pic_rgb_show = double(pic_rgb) + pic_rgb_unsharp;

pic_lsm_move = myWindow(5, pic_lsm);
pic_lsm_unsharp = double(pic_lsm) - pic_lsm_move;
pic_lsm_show = double(pic_lsm) + pic_lsm_unsharp;

pic_dicom_move = myWindow(5, pic_dicom);
pic_dicom_unsharp = double(pic_dicom) - pic_dicom_move;
pic_dicom_show = double(pic_dicom) + pic_dicom_unsharp;

[w h] = size(pic_rgb_unsharp);
min_rgb = pic_rgb_unsharp(1, 1); max_rgb = pic_rgb_unsharp(1, 1);
for i = 1:w
    for j = 1:h
        if pic_rgb_unsharp(i, j) <= min_rgb
            min_rgb = pic_rgb_unsharp(i, j);
        end
        if pic_rgb_unsharp(i, j) >= max_rgb
            max_rgb = pic_rgb_unsharp(i, j);
        end
    end
end

[w h] = size(pic_lsm_unsharp);
min_lsm = pic_lsm_unsharp(1, 1); max_lsm = pic_lsm_unsharp(1, 1);
for i = 1:w
    for j = 1:h
        if pic_lsm_unsharp(i, j) <= min_lsm
            min_lsm = pic_lsm_unsharp(i, j);
        end
        if pic_lsm_unsharp(i, j) >= max_lsm
            max_lsm = pic_lsm_unsharp(i, j);
        end
    end
end

[w h] = size(pic_dicom_unsharp);
min_dicom = pic_dicom_unsharp(1, 1); max_dicom = pic_dicom_unsharp(1, 1);
for i = 1:w
    for j = 1:h
        if pic_dicom_unsharp(i, j) <= min_dicom
            min_dicom = pic_dicom_unsharp(i, j);
        end
        if pic_dicom_unsharp(i, j) >= max_dicom
            max_dicom = pic_dicom_unsharp(i, j);
        end
    end
end
%% shoe pic
subplot(221), imshow(pic_rgb, [0 maxVal_rgb-1]); 
title('Original RGB Image');
subplot(222), imshow(pic_rgb_move, [0 maxVal_rgb-1]); 
title('Original RGB Image with Moving Average');
subplot(223), imshow(pic_rgb_unsharp, [min_rgb max_rgb]); 
title('Noise on Moving Average');
subplot(224), imshow(pic_rgb_show, [0 maxVal_rgb-1]); 
title('Unsharp Image');
figure
subplot(221), imshow(pic_lsm, [0 maxVal_lsm-1]); 
title('Original .lsm Image');
subplot(222), imshow(pic_lsm_move, [0 maxVal_lsm-1]); 
title('Original .lsm Image with Moving Average');
subplot(223), imshow(pic_lsm_unsharp, [min_lsm max_lsm]); 
title('Noise on Moving Average');
subplot(224), imshow(pic_lsm_show, [0 maxVal_lsm-1]); 
title('Unsharp Image');
figure
subplot(221), imshow(pic_dicom, [0 maxVal_dicom-1]); 
title('Original DICOM Image');
subplot(222), imshow(pic_dicom_move, [0 maxVal_dicom-1]); 
title('Original DICOM Image with Moving Average');
subplot(223), imshow(pic_dicom_unsharp, [min_dicom max_dicom]); 
title('Noise on Moving Average');
subplot(224), imshow(pic_dicom_show, [0 maxVal_dicom-1]); 
title('Unsharp Image');