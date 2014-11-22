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
    getFrame = imnoise(getFrame,'poisson');
    
    newVD{i,1} = getFrame;
    FilVD_min{i,1} = nonlinear_filter('min', newVD{i,1}, [3 3]);
    FilVD_max{i,1} = nonlinear_filter('max', newVD{i,1}, [3 3]);
    FilVD_med{i,1} = nonlinear_filter('med', newVD{i,1}, [3 3]);
end
%%
writerObj = VideoWriter('Poisson.avi');
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
    subplot(2,2,1)
    imshow(newVD{i,1},[])
    title('Grey scale original image')
   
    subplot(2,2,2)
    imshow(FilVD_min{i,1},[])
    title('Filter_minimum')
    
    subplot(2,2,3)
    imshow(FilVD_max{i,1},[])
    title('Filter_maximum')
    
    subplot(2,2,4)
    imshow(FilVD_med{i,1},[])
    title('Filter_median')

    drawnow

    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
