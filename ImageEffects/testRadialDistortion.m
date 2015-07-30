clc
clear all
close all
imgName = 'bac.jpg';
% imgName = 'cat.jpg';
% imgName = 'smallbac.jpg';
% imgName = 'ms.png';
% imgName = 'bliss.jpg';
color = imread(imgName);
img = rgb2gray(color);
figure
imshow(img,[]);
newImg = radiallyDistort(img, 10);
figure
imshow(newImg,[],'border','tight');
%Color
red = radiallyDistort(color(:,:,1), 10);
green = radiallyDistort(color(:,:,2), 10);
blue = radiallyDistort(color(:,:,3), 10);
colorImg = cat(3,red,green,blue);
figure
imshow(uint8(colorImg),'border','tight');