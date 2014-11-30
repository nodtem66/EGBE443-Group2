clear all
clc
close all
%%
i=1;
lengthVDO = 70;
input = videoinput('winvideo',1,'YUY2_640x480'); 
set(input,'TriggerRepeat',inf);  
set(input, 'ReturnedColorSpace','rgb'); 
start(input) 
while(i<=lengthVDO) 
    data = getdata(input,2); 
    vid{i,1} = data(:,:,:,2);
    imshow(vid{i,1})
    i=i+1;
end
stop(input)
disp('stop recording')
%%
for i=1:lengthVDO    
    newIm1{i,1} = myrgb2hsv(vid{i,1}); 
    newIm2{i,1} = rgb2hsv(vid{i,1});
    i
end

writerObj = VideoWriter('Webcam_HSV.avi');
writerObj.FrameRate = 4;
open(writerObj);
fig=figure;
set(gcf,'position',[100 100 600 600])
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
axis manual
hold all;
grid on;
for i=1:lengthVDO
    subplot(131), imshow(vid{i,1}), title('Original')
    subplot(132), imshow(newIm1{i,1}), title('My function')
    subplot(133), imshow(newIm2{i,1}), title('MATLAB function')
    
    drawnow;
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
disp('Finish!!')