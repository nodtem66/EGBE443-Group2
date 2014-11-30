function newpic = myYCbCr(pic)
pic = double(pic);
rgb_r = pic(:,:,1);
rgb_g = pic(:,:,2);
rgb_b = pic(:,:,3);

Y = (65.481*rgb_r + 128.553*rgb_g + 24.966*rgb_b)./255 +16;
Cb = (-37.797*rgb_r - 74.203*rgb_g + 112*rgb_b)./255+128 ;
Cr = (112*rgb_r -93.786*rgb_g - 18.214*rgb_b)./255 +128;

newpic(:,:,1) = uint8(Y);
newpic(:,:,2) = uint8(Cb);
newpic(:,:,3) = uint8(Cr);

