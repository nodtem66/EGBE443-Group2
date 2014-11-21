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
disp('Stop recording')
disp('Start creating VDO file')
%%
for i=1:lengthVDO
%     [Hx{i,1} Hy{i,1} magH{i,1} angleH{i,1}] = myEdgeDetection('g',vid{i,1});
    [Hx{i,1} Hy{i,1} magH{i,1} angleH{i,1}] = myEdgeDetection('p',vid{i,1});
%     [Hx{i,1} Hy{i,1} magH{i,1} angleH{i,1}] = myEdgeDetection('s',vid{i,1});
    
%     [MHx{i,1}, MHy{i,1}] = imgradientxy(vid{i,1},'CentralDifference');
    [MHx{i,1}, MHy{i,1}] = imgradientxy(vid{i,1},'Prewitt');
%     [MHx{i,1}, MHy{i,1}] = imgradientxy(vid{i,1},'Sobel');
    [MmagH{i,1}, MangleH{i,1}] = imgradient(MHx{i,1}, MHy{i,1});
end
%%
writerObj = VideoWriter('Webcam_Perwitt.avi');
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
    subplot(3,3,2), imshow(vid{i,1},[]), title('Original')
    subplot(3,2,3), imshowpair(Hx{i,1}, MHx{i,1},'montage'), title('Hx: My code and MATLAB function');
    subplot(3,2,4), imshowpair(Hy{i,1}, MHy{i,1},'montage'), title('Hy: My code and MATLAB function');
    subplot(3,2,5), imshowpair(magH{i,1},MmagH{i,1},'montage'), title('Gradient Magnitude: My code and MATLAB function');
    subplot(3,2,6), imshowpair(angleH{i,1},MangleH{i,1},'montage'), title('Gradient Direction: My code and MATLAB function');
    
    
    drawnow;
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);