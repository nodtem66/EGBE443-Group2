function mdata = mylsm(filename)
    
    data = imread(filename, 'TIFF');
    dimension = size(data);
    length_layer = 1
    if length(dimension) == 3
       length_layer = dimension(3)
    end
    if length(dimension) >= 2
        d_x = dimension(1);
        d_y = dimension(2);
        data(:,:, length_layer+1:3) = zeros(d_x,d_y);
    end
    mdata = lsminfo(filename);
    mdata.tiff_rawdata = data;
    imshow(data);
end