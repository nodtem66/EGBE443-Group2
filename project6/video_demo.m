clear; clc; close all;
vid = VideoReader('../raw_data/001.avi');
vout = VideoWriter('001.avi');
% get(vid)

nFrames = vid.NumberOfFrames;
vidHeight = vid.Height;
vidWidth = vid.Width;
bit = vid.BitsPerPixel;


vout.FrameRate = vid.FrameRate;
open(vout);
mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
% Size a figure based on the video's width and height.
hf = figure;
set(hf, 'position', [300 300 vidWidth vidHeight])

for k = 1 : nFrames
    t = read(vid, k);
    t = t + 100;
    mov(k).cdata = t;   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : nFrames
    t = read(vid, k);
    t = t * 10;
    mov(k).cdata = t;   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : nFrames
    t = read(vid, k);
    t = 255 - t;
    mov(k).cdata = t;   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : nFrames
    t = read(vid, k);
    for i = 1:vidHeight
        for j = 1:vidWidth
            if t(i,j,1) > 20 && t(i,j,1) < 100 && ...
               t(i,j,2) > 20 && t(i,j,2) < 100 && ...
               t(i,j,3) > 20 && t(i,j,3) < 100
                t(i,j,:) = [255;255;255];
            else
                t(i,j,:) = [0;0;0];
            end
        end
    end
    mov(k).cdata = t;   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : nFrames
    t = double(read(vid, k)) ./ 255;
    t = 255 * (-cos(pi .* t)+1)/2;
    mov(k).cdata = uint8(t);   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);
for k = 1 : nFrames
    t = read(vid, k);
    g = rgb2gray(t);
    g = myhisteq(g);
    t(:,:,1) = g;
    t(:,:,2) = g;
    t(:,:,3) = g;
    mov(k).cdata = t;   
end
writeVideo(vout, mov);
movie(hf, mov, 1, vid.FrameRate);

close(vout);