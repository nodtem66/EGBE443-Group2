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
%     [Hx{i,1} Hy{i,1} magH{i,1} angleH{i,1}] = myEdgeDetection('g',newVD{i,1});
%     [Hx{i,1} Hy{i,1} magH{i,1} angleH{i,1}] = myEdgeDetection('p',newVD{i,1});
    [Hx{i,1} Hy{i,1} magH{i,1} angleH{i,1}] = myEdgeDetection('s',newVD{i,1});

%     [MHx{i,1}, MHy{i,1}] = imgradientxy(newVD{i,1},'CentralDifference');  
%     [MHx{i,1}, MHy{i,1}] = imgradientxy(newVD{i,1},'Prewitt');
    [MHx{i,1}, MHy{i,1}] = imgradientxy(newVD{i,1},'Sobel');
    [MmagH{i,1}, MangleH{i,1}] = imgradient(MHx{i,1}, MHy{i,1});
    
 
end
%%
writerObj = VideoWriter('EdgeSobel.avi');
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
    subplot(3,3,2), imshow(newVD{i,1},[]), title('Original')
    subplot(3,2,3), imshowpair(Hx{i,1}, MHx{i,1},'montage'), title('Hx: My code and MATLAB function');
    subplot(3,2,4), imshowpair(Hy{i,1}, MHy{i,1},'montage'), title('Hy: My code and MATLAB function');
    subplot(3,2,5), imshowpair(magH{i,1},MmagH{i,1},'montage'), title('Gradient Magnitude: My code and MATLAB function');
    subplot(3,2,6), imshowpair(angleH{i,1},MangleH{i,1},'montage'), title('Gradient Direction: My code and MATLAB function');
    
    drawnow    
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
disp('Done')