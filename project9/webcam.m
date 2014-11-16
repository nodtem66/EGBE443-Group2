clc; clear all;
vid = videoinput('winvideo',1,'YUY2_320x240');

set(vid, 'TriggerRepeat', Inf);
vid.FrameGrabInterval = 5;
vid_src = getselectedsource(vid);
set(vid_src, 'Tag', 'motion detect');

h = figure;
button = uicontrol('Style', 'pushbutton', 'String', 'Stop',...
        'Position', [10 10 50 20],...
        'Callback', 'running = false;');  
start(vid);

try
    running = true;
    gaussian_f = @(sigma) (@(x,y) ((exp(-(x.^2 + y.^ 2) ./ ( 2 .* (sigma .^ 2))))));
    maxican_hat_f = @(sigma) (@(x,y) ((2/(sqrt(3*sigma)*pi^0.25)) .* (1-(x.^2+y.^2)/sigma^2) .* exp(-1/2 .* (x.^2+y.^2)/sigma^2)));
    window_0 = ones(5,5) ./ (5*5);
    sobel_g = [1 2 1; 0 0 0; -1 -2 -1];
    sobel_v = sobel_g';
    pitwitt_g = [1 1 1; 0 0 0; -1 -1 -1];
    pitwitt_v = pitwitt_g';
    window_1 = window_filter(gaussian_f(1), [5 5]);
    window_2 = window_filter(maxican_hat_f(1.8), [5 5]);
    
    vout = videoWriter('001.avi');
    vout.FrameRate = 10;
    open(vout);

    while(vid.FramesAcquired >= 0 && running)
        I = getdata(vid, 1);
        f = double(I(:,:,1,1));
        aa = conv2(f, sobel_g, 'same');
        bb = conv2(f, sobel_v, 'same');
        a = sqrt(aa.^2 + bb.^2);
        cc = conv2(f, pitwitt_g, 'same');
        dd = conv2(f, pitwitt_v, 'same');
        b = sqrt(cc.^2 + dd.^2);
        %
        subplot('Position', [0 0 .5 1]), imshow(uint8(a));
        subplot('Position', [0.5 0 .5 1]), imshow(uint8(b));
        %subplot(2,2,2,'Position', [0.5 0.5 0.5 0.5]), imshow(uint8(conv2(f, window_0, 'same')));
        %subplot(2,2,3,'Position', [0 0 0.5 0.5]), imshow(uint8(aa));
        %subplot(2,2,4,'Position', [0.5 0 0.5 0.5]), imshow(uint8(bb));
        %}
        writeVideo(vout, getframe(h));
    end
catch ME
    fprintf('Interupt\n');
end
flushdata(vid, 'all');
stop(vid);
fprintf('End\n');
close(vout);
close all;