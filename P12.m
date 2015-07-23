%Andrew Katz
%Homework 3
%Problem 12
close all
clear all
clc
load ('hawaii.mat');
%figure
%imshow(hawaii_m, []);

cameraMatrix = getCameraMatrix();
%cameraMatrix * [0;0;1;1]
img(1,1) = 0;
for row =1: size(hawaii_m,1) %size(hawaii_m,1):-1:1
    for col = 1:size(hawaii_m,2) %:-1:1
        pt = [row*180;col*180;hawaii_m(row,col);1];
        fin = cameraMatrix * pt;
        try
        img(abs(round(fin(1)/fin(3)))+1, abs(round(fin(2)/fin(3)))+1) = hawaii_m(row,col);
        catch
        end
    end
end
disp(img);
figure
imshow(img, []);


