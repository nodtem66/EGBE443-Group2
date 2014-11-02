clear all
clc
close all
%%
i=1;
lengthVDO = 70;
input = videoinput('winvideo',1,'YUY2_640x480'); 
set(input,'TriggerRepeat',inf);  
set(input, 'ReturnedColorSpace','grayscale'); 
start(input) 
while(i<=lengthVDO) 
    data = getdata(input,2); 
    vid{i,1} = data(:,:,:,2);
    imshow(vid{i,1})
    i=i+1;
end
stop(input)
%%
for i=1:lengthVDO
    vid_move = myWindow_v1(5,vid{i,1});
    vid_unsharp = double(vid{i,1}) - vid_move;
    vid_show{i,1} = double(vid{i,1}) + vid_unsharp;
end
%%
writerObj = VideoWriter('Unsharp_webcam.avi');
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
    subplot(2,1,1)
    imshow(vid{i,1},[0 255]);
    title('Original')
     
    subplot(2,1,2)
    imshow(vid_show{i,1},[0 255])
    title('Unsharp')
    drawnow;
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
disp('Finish!!')