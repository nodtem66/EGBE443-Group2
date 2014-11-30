clear all
clc
close all
%%
vid = VideoReader('jpeg.avi', 'Tag', 'My reader object');
nFrames = vid.NumberOfFrames;
vidHeight = vid.Height;
vidWidth = vid.Width;

mov(1:nFrames) = ...
    struct('cdata',zeros(vidHeight,vidWidth, 3,'uint8'),...
    'colormap',[]);

for k = 1 : nFrames
    mov(k).cdata = read(vid,k);
end
hf = figure;
%%
for i=1:nFrames
    getFrame = mov(i).cdata;
    
    vdo{i,1} = getFrame;
    newIm1{i,1} = myYCbCr(vdo{i,1}); 
    newIm2{i,1} = rgb2ycbcr(vdo{i,1});  
    i
end
%%
writerObj = VideoWriter('YCbCr_video.avi');
writerObj.FrameRate = 30;
open(writerObj);
fig=figure;
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
axis manual
hold all;
grid on;
%%
for i = 1:size(vdo,1)    
    subplot(131), imshow(vdo{i,1}), title('Original')
    subplot(132), imshow(newIm1{i,1}), title('My function')
    subplot(133), imshow(newIm2{i,1}), title('MATLAB function')
    
    drawnow    
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
disp('Done')