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

getDat = mov.cdata;
check_R = getDat(:,:,1);
check_G = getDat(:,:,2);
check_B = getDat(:,:,3);
%%
maxVal_R = 0;
maxVal_G = 0;
maxVal_B = 0;
for i=1:size(check_R,1) 
    for j=1:size(check_R,2)
        if check_R(i,j)>=maxVal_R
            maxVal_R = check_R(i,j);
        end
        if check_G(i,j)>=maxVal_G
            maxVal_G = check_G(i,j);
        end
        if check_B(i,j)>=maxVal_B
            maxVal_B = check_B(i,j);
        end
    end
end
maxVal_R = maxVal_R+1;
maxVal_G = maxVal_G+1;
maxVal_B = maxVal_B+1;

%%

for i=1:nFrames
    getFrame = mov(i).cdata;
    
    get_R = getFrame(:,:,1);
    get_G = getFrame(:,:,2);
    get_B = getFrame(:,:,3);
    [data_R, data_G, data_B] = myRGB(get_R,get_G,get_B, maxVal_R, maxVal_G, maxVal_B);

    subplot(2,1,1);     imshow(getFrame);    
    subplot(2,3,4);     bar(data_R(:,1));
    subplot(2,3,5);     bar(data_G(:,1));
    subplot(2,3,6);     bar(data_B(:,1));
    
    drawnow
end

