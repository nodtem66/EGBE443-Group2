vid = VideoReader('jpeg.avi', 'Tag', 'My reader object');
% get(vid)

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
set(hf, 'position', [150 150 vidWidth vidHeight])

movie(hf, mov, 1, vid.FrameRate);