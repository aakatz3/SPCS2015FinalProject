close all
clear all
clc
img = imread('bac.jpg');
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
vigFact = 45;
distFact = 10;
red = applyVignette(red,vigFact);
red = radiallyDistort(red,distFact);
green = applyVignette(green,vigFact);
green = radiallyDistort(green,distFact);
blue = applyVignette(blue,vigFact);
blue = radiallyDistort(blue,distFact);
img = cat(3,red,green,blue);
img = uint8(img);
imshow(img, 'border','tight');