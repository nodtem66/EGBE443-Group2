clear all
clc
close all
%%
Y = imread('Ping.jpg'); % Input file pic name

R = Y(:,:,1);
G = Y(:,:,2);
B = Y(:,:,3);

Rd = double(R);
Gd = double(G);
Bd = double(B);

[data_R, data_G, data_B] = myRGB(Rd,Gd,Bd); % this function calculate histrograms
%%
figure(1);           
imshow(Y); 

figure(2);      
subplot(3,2,1);     imhist(R);      
xlim([-10 300]);    ylim([0 10000]);        
subplot(3,2,2);      
bar(data_R(:,1),data_R(:,2));   
xlim([-10 300]);
ylim([0 10000]);

subplot(3,2,3);     imhist(G);      
xlim([-10 300]);    ylim([0 10000]);        
subplot(3,2,4);      
bar(data_G(:,1),data_G(:,2));   
xlim([-10 300]);
ylim([0 10000]);

subplot(3,2,5);     imhist(B);      
xlim([-10 300]);    ylim([0 10000]);        
subplot(3,2,6);      
bar(data_B(:,1),data_B(:,2));   
xlim([-10 300]);
ylim([0 10000]);