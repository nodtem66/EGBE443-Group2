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
disp('stop recording')
%%
for i=1:size(vid,1)
    vid_bw{i,1} = im2bw(vid{i,1});
end
mask1 = createCircle(5);  
mask2 = createSquare(5);    
mask3 = createDonut(15,7);  
mask4 = createDaimon(3); 
for i=1:lengthVDO    
    newIm1{i,1} = myDilation(vid_bw{i,1},mask1);   mtIm1{i,1} = imdilate(vid_bw{i,1},mask1);
    newIm2{i,1} = myDilation(vid_bw{i,1},mask2);   mtIm2{i,1} = imdilate(vid_bw{i,1},mask2);
    newIm3{i,1} = myDilation(vid_bw{i,1},mask3);   mtIm3{i,1} = imdilate(vid_bw{i,1},mask3);
    newIm4{i,1} = myDilation(vid_bw{i,1},mask4);   mtIm4{i,1} = imdilate(vid_bw{i,1},mask4); 
    i
end
%%
writerObj = VideoWriter('Webcam_dilation.avi');
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
    subplot(3,4,[1 2]), imshow(vid{i,1},[]),        title('Original')
    subplot(3,4,[3 4]), imshow(vid_bw{i,1},[]),     title('BW')
    subplot(3,4,5),     imshow(newIm1{i,1},[]),     title({'My code dilation';'with circle'})
    subplot(3,4,6),     imshow(mtIm2{i,1},[]),      title({'MATLAB dilation';'with circle'})
    subplot(3,4,7),     imshow(newIm2{i,1},[]),     title({'My code dilation';'with square'})
    subplot(3,4,8),     imshow(mtIm4{i,1},[]),      title({'MATLAB dilation';'with square'})
    subplot(3,4,9),     imshow(newIm3{i,1},[]),     title({'My code dilation';'with donut'})
    subplot(3,4,10),    imshow(mtIm3{i,1},[]),      title({'MATLAB dilation';'with donut'})
    subplot(3,4,11),    imshow(newIm4{i,1},[]),     title({'My code dilation';'with diamond'})
    subplot(3,4,12),    imshow(mtIm4{i,1},[]),      title({'MATLAB dilation';'with diamond'})
    
    drawnow;
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(writerObj);
disp('Finish!!')