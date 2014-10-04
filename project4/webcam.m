clc; clear all;
vid = videoinput('winvideo',1,'YUY2_320x240');


%preview(vid);
set(vid, 'TriggerRepeat', Inf);
vid.FrameGrabInterval = 3;
vid_src = getselectedsource(vid);
set(vid_src, 'Tag', 'motion detect');
figure;
start(vid);
try
    while(vid.FramesAcquired >= 0)
        data = getdata(vid, 2);
        diff = imabsdiff(data(:,:,:,1), data(:,:,:,2));
        imshow(diff(:,:,:,:));
    end
catch err
    fprintf('Exit');
end
flushdata(vid, 'all');
stop(vid);
fprintf('End\n');
    