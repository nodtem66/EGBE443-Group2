function [pic_1, pic_2, pic_3, pic] = mylsm(filename)    
    pic = imread(filename, 'TIFF');
    dimension = size(pic);
    length_layer = 1
    if length(dimension) == 3
       length_layer = dimension(3)
    end
    if length(dimension) >= 2
        d_x = dimension(1);
        d_y = dimension(2);
        pic(:,:, length_layer+1:3) = zeros(d_x,d_y);
    end
    mdata.tiff_rawdata = pic;
    pic_1 = pic(:,:,1);
    pic_2 = pic(:,:,2);
    pic_3 = pic(:,:,3);
end