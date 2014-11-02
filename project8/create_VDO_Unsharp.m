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
    getFrame = rgb2gray(getFrame);
%     getFrame = imnoise(getFrame,'salt & pepper');
    
    newVD{i,1} = getFrame;
    pic_move = myWindow(5, newVD{i,1});
    pic_unsharp = double(newVD{i,1}) - pic_move;
    FilVD_unsharp{i,1} = double(newVD{i,1}) + pic_unsharp;
end
%%
writerObj = VideoWriter('Unsharp.avi');
writerObj.FrameRate = 30;
open(writerObj);
fig=figure;
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
axis manual
hold all;
grid on;
%%
for i = 1:size(newVD,1)
    subplot(2,1,1)
    imshow(newVD{i,1},[0 255])
    title('Grey scale original image')
   
    subplot(2,1,2)
    imshow(FilVD_unsharp{i,1},[0 255])
    title('Filter_Unsharp')

    drawnow

    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
