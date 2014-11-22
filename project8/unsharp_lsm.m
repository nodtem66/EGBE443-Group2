clear; close all; clc;
pic = mylsm('../project8/Cntrl1.lsm');
lsm_info = imfinfo('../project8/Cntrl1.lsm');
[w h] = lsm_info.BitDepth;
maxVal = 2^(h/3);

pic_gn = imnoise(pic, 'gaussian');
pic_gn_move = myWindow(5, pic_gn);
pic_gn_unsharp = double(pic) - pic_gn_move;
pic_gn_show = double(pic) + pic_gn_unsharp;

pic_pn = imnoise(pic, 'poisson');
pic_pn_move = myWindow(5, pic_pn);
pic_pn_unsharp = double(pic) - pic_pn_move;
pic_pn_show = double(pic) + pic_pn_unsharp;

pic_spn = imnoise(pic, 'salt & pepper');
pic_spn_move = myWindow(5, pic_spn);
pic_spn_unsharp = double(pic) - pic_spn_move;
pic_spn_show = double(pic) + pic_spn_unsharp;

[w h] = size(pic_gn_unsharp);
min_gn = pic_gn_unsharp(1, 1); max_gn = pic_gn_unsharp(1, 1);
for i = 1:w
    for j = 1:h
        if pic_gn_unsharp(i, j) <= min_gn
            min_gn = pic_gn_unsharp(i, j);
        end
        if pic_gn_unsharp(i, j) >= max_gn
            max_gn = pic_gn_unsharp(i, j);
        end
    end
end

[w h] = size(pic_pn_unsharp);
min_pn = pic_pn_unsharp(1, 1); max_pn = pic_pn_unsharp(1, 1);
for i = 1:w
    for j = 1:h
        if pic_pn_unsharp(i, j) <= min_pn
            min_pn = pic_pn_unsharp(i, j);
        end
        if pic_pn_unsharp(i, j) >= max_pn
            max_pn = pic_pn_unsharp(i, j);
        end
    end
end

[w h] = size(pic_spn_unsharp);
min_spn = pic_spn_unsharp(1, 1); max_spn = pic_spn_unsharp(1, 1);
for i = 1:w
    for j = 1:h
        if pic_spn_unsharp(i, j) <= min_spn
            min_spn = pic_spn_unsharp(i, j);
        end
        if pic_spn_unsharp(i, j) >= max_spn
            max_spn = pic_spn_unsharp(i, j);
        end
    end
end
%% show pic gaussian
subplot(221), imshow(pic, [0 maxVal-1]); 
title('Original Image');
subplot(222), imshow(pic_gn, [0 maxVal-1]); 
title('Original Image with Gaussian Noise');
subplot(223), imshow(pic_gn_move, [min_gn max_gn]); 
title('Moving Average in Noise Image');
subplot(224), imshow(pic_gn_show, [0 maxVal-1]); 
title('Unsharp Image');
%% show pic poisson
figure
subplot(221), imshow(pic, [0 maxVal-1]); 
title('Original Image');
subplot(222), imshow(pic_pn, [0 maxVal-1]); 
title('Original Image with Poisson Noise');
subplot(223), imshow(pic_pn_move, [min_pn max_pn]); 
title('Moving Average in Noise Image');
subplot(224), imshow(pic_pn_show, [0 maxVal-1]); 
title('Unsharp Image');
%% show pic salt&pepper
figure
subplot(221), imshow(pic, [0 maxVal-1]); 
title('Original Image');
subplot(222), imshow(pic_spn, [0 maxVal-1]); 
title('Original Image with Salt & Pepper Noise');
subplot(223), imshow(pic_spn_move, [min_spn max_spn]); 
title('Moving Average in Noise Image');
subplot(224), imshow(pic_spn_show, [0 maxVal-1]); 
title('Unsharp Image');