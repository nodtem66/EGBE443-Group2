clear; clc; close all;
vid = VideoReader('../raw_data/001.avi');
vout = VideoWriter('001.avi');
% get(vid)

nFrames = vid.NumberOfFrames;
vidHeight = vid.Height;
vidWidth = vid.Width;
bit = vid.BitsPerPixel;


vout.FrameRate = vid.FrameRate/2;
open(vout);
mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
% Size a figure based on the video's width and height.
hf = figure;
set(hf, 'position', [300 300 vidWidth vidHeight])

gaussian_f = @(sigma) (@(x,y) ((exp(-(x.^2 + y.^ 2) ./ ( 2 .* (sigma .^ 2))))));
    maxican_hat_f = @(sigma) (@(x,y) ((2/(sqrt(3*sigma)*pi^0.25)) .* (1-(x.^2+y.^2)/sigma^2) .* exp(-1/2 .* (x.^2+y.^2)/sigma^2)));
    window_0 = ones(3,3) ./ (3*3);
    sobel_g = [1 2 1; 0 0 0; -1 -2 -1];
    sobel_v = sobel_g';
    window_1 = window_filter(gaussian_f(1), [5 5]);
    window_2 = window_filter(maxican_hat_f(0.7), [7 7]);

for k = 1 : nFrames
    t = read(vid, k);
    mov(k).cdata = t;
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : 30
    mov(k).cdata = t;
end
writeVideo(vout, mov);
fprintf('1\n');
for k = 1 : nFrames
    t = read(vid, k);
    t(:,:,1) = conv2(double(t(:,:,1)), window_0, 'same');
    t(:,:,2) = conv2(double(t(:,:,2)), window_0, 'same');
    t(:,:,3) = conv2(double(t(:,:,3)), window_0, 'same');
    mov(k).cdata = uint8(t);   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : 30
    mov(k).cdata = t;
end
writeVideo(vout, mov);
fprintf('2\n');
for k = 1 : nFrames
    t = read(vid, k);
    sigma = ((k-mod(k,4)))/4;
    window_x = window_filter(gaussian_f(sigma), [3+sigma 3+sigma]);
    t(:,:,1) = conv2(double(t(:,:,1)), window_x, 'same');
    t(:,:,2) = conv2(double(t(:,:,2)), window_x, 'same');
    t(:,:,3) = conv2(double(t(:,:,3)), window_x, 'same');
    mov(k).cdata = uint8(t);   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : 30
    mov(k).cdata = t;
end
writeVideo(vout, mov);
fprintf('3\n');
for k = 1 : nFrames
     t = read(vid, k);
    w = ((k-mod(k,2)))/2;
    window_x = window_filter(maxican_hat_f(1.1), [3 3]);
    t(:,:,1) = conv2(double(t(:,:,1)), window_x, 'same');
    t(:,:,2) = conv2(double(t(:,:,2)), window_x, 'same');
    t(:,:,3) = conv2(double(t(:,:,3)), window_x, 'same'); 
    mov(k).cdata = uint8(t);
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : 30
    mov(k).cdata = t;
end
writeVideo(vout, mov);
fprintf('4\n');
for k = 1 : nFrames
     t = read(vid, k);
    w = ((k-mod(k,2)))/2;
    window_x = window_filter(maxican_hat_f(1.8), [5 5]);
    t(:,:,1) = conv2(double(t(:,:,1)), window_x, 'same');
    t(:,:,2) = conv2(double(t(:,:,2)), window_x, 'same');
    t(:,:,3) = conv2(double(t(:,:,3)), window_x, 'same'); 
    mov(k).cdata = uint8(t);
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : 30
    mov(k).cdata = t;
end
writeVideo(vout, mov);
fprintf('5\n');
%{
for k = 1 : nFrames
    t = read(vid, k);
    t = conv2(double(t), window_2);
    mov(k).cdata = uint8(t);   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
%}
close(vout);
fprintf('End\n');