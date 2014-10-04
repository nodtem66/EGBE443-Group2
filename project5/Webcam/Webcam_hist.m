clear all
clc
close all
%%
figure
Exit = uicontrol('Style','pushbutton','callback','stop',...
    'position',[430 300 100 40],'String','Stop');
%%
runProgram = true;
i=1;
input = videoinput('winvideo',1,'YUY2_640x480'); 
set(input,'TriggerRepeat',inf);  
set(input, 'ReturnedColorSpace', 'grayscale'); 
start(input) 
while(runProgram) 
    data = getdata(input,2); 
    vid = data(:,:,:,2);
    
    myHist = myBW(vid);
    
    subplot(2,1,1)
    imshow(vid);
    subplot(2,1,2)
    bar(myHist); 

    drawnow;
end

