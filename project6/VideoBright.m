clear all
clc
close all
%%
addpath(genpath('../Point operations/Original photo'))
Y = rgb2gray(imread('Parn.jpg'));
start = 1;
stop = 100;
%%
writerObj = VideoWriter('Brightness.avi');
writerObj.FrameRate = 2;
open(writerObj);
fig=figure;
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
axis manual
hold all;
grid on;
%%
for i = start:stop
    subplot(2,2,1)
    imshow(Y)
    title('Grey scale original image')
    subplot(2,2,2)
    data_A = myBW(Y);
    bar(data_A)
    title('Histrogram')
    xlim([0 255])
    subplot(2,2,3)
    imshow(Y+i)
    title('Bright image')
   
    subplot(2,2,4)
    data_B = myBW(Y+i);
    bar(data_B)
    title(['Contrast + ', num2str(i)])
    xlim([0 255])
    drawnow
    i;
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
