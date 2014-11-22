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
    
    newVD{i,1} = getFrame;
%     ImC{i,1} = myCanny(getFrame,100);
%     ImM{i,1} = edge(getFrame,'canny');
    [Lx ImL{i,1}] = myLaplaceSharping(getFrame);

end
%%
writerObj = VideoWriter('Laplace.avi');
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
%     subplot(1,3,1), imshow(newVD{i,1},[]), title('Original')
%     subplot(1,3,2), imshow(ImC{i,1}), title('My code');
%     subplot(1,3,3), imshow(ImM{i,1}), title('MATLAB function');
    
    subplot(1,2,1), imshow(newVD{i,1},[]), title('Original')
    subplot(1,2,2), imshow(ImL{i,1},[]), title('Laplace')

    drawnow    
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
disp('Done')