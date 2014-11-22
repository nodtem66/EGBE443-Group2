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
annotation('textbox', [0 .95 0.2 0.05], 'String','Original', 'BackgroundColor', 'white');
annotation('textbox', [0.5 0.95 0.2 0.05], 'String','A', 'BackgroundColor', 'white');
annotation('textbox', [0 0.45 0.2 0.05], 'String','B', 'BackgroundColor', 'white');
annotation('textbox', [0.5 0.45 0.2 0.05], 'String','C', 'BackgroundColor', 'white');
start(vid);

try
    running = true;
    gaussian_f = @(sigma) (@(x,y) ((exp(-(x.^2 + y.^ 2) ./ ( 2 .* (sigma .^ 2))))));
    maxican_hat_f = @(sigma) (@(x,y) ((2/(sqrt(3*sigma)*pi^0.25)) .* (1-(x.^2+y.^2)/sigma^2) .* exp(-1/2 .* (x.^2+y.^2)/sigma^2)));
    m2_hat_f = @(sigma) (@(x,y) (-1/pi/sigma^2 .* (1 - (x.^2+y.^2)/(2*sigma)) .* exp(-(x.^2+y.^2)/(2*sigma))));
    window_0 = ones(5,5) ./ (5*5);
    sobel_g = [1 2 1; 0 0 0; -1 -2 -1];
    sobel_v = sobel_g';
    window_1 = window_filter(gaussian_f(1), [5 5]);
    window_2 = window_filter(maxican_hat_f(0.3), [5 5]);
    window_3 = window_filter(m2_hat_f(0.5), [7 7]);
    
    vout = videoWriter('001.avi');
    vout.FrameRate = 10;
    open(vout);

    while(vid.FramesAcquired >= 0 && running)
        I = getdata(vid, 1);
        f = double(I(:,:,1,1));
        %
        subplot(2,2,1,'Position', [0 0.5 0.5 0.5]), imshow(uint8(f));
        %subplot(2,2,2,'Position', [0.5 0.5 0.5 0.5]), imshow(uint8(sqrt(conv2(f, sobel_g, 'same').^2 + conv2(f, sobel_v, 'same').^2)));
        subplot(2,2,2,'Position', [0.5 0.5 0.5 0.5]), imshow(uint8(conv2(f, window_3, 'same')));
        subplot(2,2,3,'Position', [0 0 0.5 0.5]), imshow(uint8(conv2(f, window_1, 'same')));
        subplot(2,2,4,'Position', [0.5 0 0.5 0.5]), imshow(uint8(conv2(f, window_2, 'same')));
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