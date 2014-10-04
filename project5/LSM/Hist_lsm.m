clear all
clc
close all
%%
addpath(genpath('../Histrgram/LSM file/lsm'))
filename = 'Cntrl1.lsm';
[pic_1, pic_2, pic_3, pic] = mylsm(filename);
%%
data_1 = myBW(pic_1);
data_2 = myBW(pic_2);
data_3 = myBW(pic_3);
data = myBW(pic);
%%
figure(1);  imshow(pic);
figure(2);

subplot(3,3,1);     imshow(pic_1);       
subplot(3,3,2);     imhist(pic_1);                      xlim([-10 300]);    ylim([0 40000]);
subplot(3,3,3);     bar(data_1(:,1),data_1(:,2));       xlim([-10 300]);    ylim([0 40000]);

subplot(3,3,4);     imshow(pic_2);       
subplot(3,3,5);     imhist(pic_2);                      xlim([-10 300]);    ylim([0 40000]);
subplot(3,3,6);     bar(data_2(:,1),data_2(:,2));       xlim([-10 300]);    ylim([0 40000]);

subplot(3,3,7);     imshow(pic_3);       
subplot(3,3,8);     imhist(pic_3);                      xlim([-10 300]);    ylim([0 40000]);
subplot(3,3,9);     bar(data_3(:,1),data_3(:,2));       xlim([-10 300]);    ylim([0 40000]);
