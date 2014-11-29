clear all
clc

% pic = imread('coins.png');
% pic = im2bw(pic);
% newIm = mySkeleton(pic);
% 
% subplot(131), imshow(pic), title('Original image')
% subplot(132), imshow(newIm), title('My function')
% subplot(133), imshow(bwmorph(im2bw(pic),'skel','Inf')), title('MATLAB function')
%% Uncomment for creating a VDO
pic = imread('coins.png');
pic = im2bw(pic);

writerObj = VideoWriter('skeleton_process.avi');
writerObj.FrameRate = 6;
open(writerObj);
fig=figure;
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
axis manual
hold all;
grid on;
%%
newIm_8 = padarray(pic,[1 1]);
[m n] = size(newIm_8);
temp = zeros(m,n);
Im1 = zeros(m,n);
Im2 = zeros(m,n);
size_val = size(Im1,1)*size(Im1,2);
start = true;
r=1;
while start
    for i=2:m-1
        for j=2:n-1
            if newIm_8(i-1,j-1) ==0 && ...
                    newIm_8(i-1,j) ==0 && ...
                    newIm_8(i-1,j+1) ==0 && ...
                    newIm_8(i,j) == 1 && ...
                    newIm_8(i+1,j-1) ==1 && ...
                    newIm_8(i+1,j) ==1 && ...
                    newIm_8(i+1,j+1)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_1 = newIm_8 - temp;
    for i=2:m-1
        for j=2:n-1
            if newIm_1(i-1,j) ==0 && ...
                    newIm_1(i-1,j+1) == 0 && ...
                    newIm_1(i,j+1) == 0 && ...
                    newIm_1(i,j-1) == 1 && ...
                    newIm_1(i,j) == 1 && ...
                    newIm_1(i+1,j-1) == 1 && ...
                    newIm_1(i+1,j)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_2 = newIm_1 - temp;
    for i=2:m-1
        for j=2:n-1
            if newIm_2(i-1,j+1) ==0 && ...
                    newIm_2(i,j+1) == 0 && ...
                    newIm_2(i+1,j+1) == 0 && ...
                    newIm_2(i-1,j-1) == 1 && ...
                    newIm_2(i,j-1) == 1 && ...
                    newIm_2(i+1,j-1) == 1 && ...
                    newIm_2(i,j)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_3 = newIm_2 - temp;
    for i=2:m-1
        for j=2:n-1
            if newIm_3(i,j+1) ==0 && ...
                    newIm_3(i+1,j) == 0 && ...
                    newIm_3(i+1,j+1) == 0 && ...
                    newIm_3(i-1,j-1) == 1 && ...
                    newIm_3(i,j-1) == 1 && ...
                    newIm_3(i-1,j) == 1 && ...
                    newIm_3(i,j)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_4 = newIm_3 - temp;
    for i=2:m-1
        for j=2:n-1
            if newIm_4(i+1,j-1) ==0 && ...
                    newIm_4(i+1,j) == 0 && ...
                    newIm_4(i+1,j+1) == 0 && ...
                    newIm_4(i-1,j-1) == 1 && ...
                    newIm_4(i-1,j) == 1 && ...
                    newIm_4(i-1,j+1) == 1 && ...
                    newIm_4(i,j)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_5 = newIm_4 - temp;
    for i=2:m-1
        for j=2:n-1
            if newIm_5(i,j-1) ==0 && ...
                    newIm_5(i+1,j-1) == 0 && ...
                    newIm_5(i+1,j) == 0 && ...
                    newIm_5(i-1,j) == 1 && ...
                    newIm_5(i-1,j+1) == 1 && ...
                    newIm_5(i,j+1) == 1 && ...
                    newIm_5(i,j)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_6 = newIm_5 - temp;
    for i=2:m-1
        for j=2:n-1
            if newIm_6(i-1,j-1) ==0 && ...
                    newIm_6(i,j-1) == 0 && ...
                    newIm_6(i+1,j-1) == 0 && ...
                    newIm_6(i,j) == 1 && ...
                    newIm_6(i-1,j+1) == 1 && ...
                    newIm_6(i,j+1) == 1 && ...
                    newIm_6(i+1,j+1)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_7 = newIm_6 - temp;
    for i=2:m-1
        for j=2:n-1
            if newIm_7(i-1,j-1) ==0 && ...
                    newIm_7(i,j-1) == 0 && ...
                    newIm_7(i-1,j) == 0 && ...
                    newIm_7(i,j) == 1 && ...
                    newIm_7(i,j+1) == 1 && ...
                    newIm_7(i+1,j) == 1 && ...
                    newIm_7(i+1,j+1)==1
                temp(i,j)=1;
            else
                temp(i,j)=0;
            end
        end
    end
    newIm_8 = newIm_7 - temp;
    
    Im1 = Im2;
    Im2 = newIm_8;
    dev(Im2-Im1==0)=1;
    dev(Im2-Im1~=0)=0;
    sum_dev = sum(dev(:));
    if sum_dev==size_val
        newIm = newIm_8(2:m-1,2:n-1);
        break;
    end
    
    imshow(newIm_8), title(['Iteration = ',num2str(r)])
    r=r+1;
    drawnow
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end

close(writerObj);
disp('Done')

