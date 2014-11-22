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
mask1 = createCircle(5);  
mask2 = createSquare(5);    
mask3 = createDonut(15,7);  
mask4 = createDaimon(3); 

for i=1:nFrames
    getFrame = mov(i).cdata;
    getFrame = im2bw(getFrame);
    
    vdo{i,1} = getFrame;
    newIm1{i,1} = myDilation(vdo{i,1},mask1);   mtIm1{i,1} = imdilate(vdo{i,1},mask1);
    newIm2{i,1} = myDilation(vdo{i,1},mask2);   mtIm2{i,1} = imdilate(vdo{i,1},mask2);
    newIm3{i,1} = myDilation(vdo{i,1},mask3);   mtIm3{i,1} = imdilate(vdo{i,1},mask3);
    newIm4{i,1} = myDilation(vdo{i,1},mask4);   mtIm4{i,1} = imdilate(vdo{i,1},mask4);    
end
%%
writerObj = VideoWriter('Dilation.avi');
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
    subplot(3,4,[2 3]), imshow(vdo{i,1},[]),        title('Original')
    subplot(3,4,5),     imshow(newIm1{i,1},[]),     title({'My code dilation';'with circle'})
    subplot(3,4,6),     imshow(mtIm2{i,1},[]),      title({'MATLAB dilation';'with circle'})
    subplot(3,4,7),     imshow(newIm2{i,1},[]),     title({'My code dilation';'with square'})
    subplot(3,4,8),     imshow(mtIm4{i,1},[]),      title({'MATLAB dilation';'with square'})
    subplot(3,4,9),     imshow(newIm3{i,1},[]),     title({'My code dilation';'with donut'})
    subplot(3,4,10),    imshow(mtIm3{i,1},[]),      title({'MATLAB dilation';'with donut'})
    subplot(3,4,11),    imshow(newIm4{i,1},[]),     title({'My code dilation';'with diamond'})
    subplot(3,4,12),    imshow(mtIm4{i,1},[]),      title({'MATLAB dilation';'with diamond'})
    
    drawnow    
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
disp('Done')