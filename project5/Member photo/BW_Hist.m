clear all
clc
close all
%%
addpath(genpath('../Member photo/Original photo'))
% Y = rgb2gray(imread('Jong.jpg'));
% Y = rgb2gray(imread('Lhon.jpg'));
% Y = rgb2gray(imread('Parn.jpg'));
% Y = rgb2gray(imread('Ping.jpg'));
Y = rgb2gray(imread('Print.jpg'));
% Y = rgb2gray(imread('Ting.jpg'));
% Y = rgb2gray(imread('Ton.jpg'));
data = myBW(Y);
%%
figure(1);      
imshow(Y);
figure(2);      
subplot(1,2,1);  
imhist(Y);      
xlim([-10 300]);        
ylim([0 10000]);
subplot(1,2,2);  
bar(data(:,1),data(:,2));   
xlim([-10 300]);
ylim([0 10000]);