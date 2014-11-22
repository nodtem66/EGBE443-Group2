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

for k = 1 : nFrames
     t = read(vid, k);
    t(:,:,1) = modified_sobel(t(:,:,1));
    t(:,:,2) = modified_sobel(t(:,:,2));
    t(:,:,3) = modified_sobel(t(:,:,3));
    mov(k).cdata = uint8(t);
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
close(vout);
fprintf('End\n');