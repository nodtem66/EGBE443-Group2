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
    vid_noise{i,1} = imnoise(vid{i,1},'gaussian');
    vid_min{i,1} = nonlinear_filter('min', vid_noise{i,1}, [3 3]);
    vid_max{i,1} = nonlinear_filter('max', vid_noise{i,1}, [3 3]);
    vid_med{i,1} = nonlinear_filter('med', vid_noise{i,1}, [3 3]);
end
%%
writerObj = VideoWriter('MinMedMax_webcam_Gaussian.avi');
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
    subplot(2,2,1)
    imshow(vid_noise{i,1},[])
    title('Nosie')
   
    subplot(2,2,2)
    imshow(vid_min{i,1},[])
    title('Filter_minimum')
    
    subplot(2,2,3)
    imshow(vid_max{i,1},[])
    title('Filter_maximum')
    
    subplot(2,2,4)
    imshow(vid_med{i,1},[])
    title('Filter_median')
    
    drawnow;
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);