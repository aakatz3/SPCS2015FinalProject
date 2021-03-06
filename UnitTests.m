%% Pre Test Setup
clear all
close all
clc
mkdir Out
imgName = 'stanford.jpg';
vigDeg = 45;
distort = 30;
fig = figure;
%% Original image
img = imread(imgName);
imshow(img,[],'Border','tight');
saveas(fig,'Out\orig.jpg');
%% Apply Vignette (Black and White)
img = rgb2gray(imread(imgName));
bwVig = applyVignette(img, vigDeg);
fig = figure;
imshow(bwVig,[],'Border','tight');
saveas(fig,'Out\vigBW.jpg');
%% Apply Vignette (Color)
img = imread(imgName);
rVig = applyVignette(img(:,:,1), vigDeg);
gVig = applyVignette(img(:,:,2), vigDeg);
bVig = applyVignette(img(:,:,3), vigDeg);
colorVig = uint8(cat(3,rVig,gVig,bVig));
fig = figure;
imshow(colorVig,'Border','tight');
saveas(fig,'Out\vigCol.jpg');
%% Apply Radial Distortion (Black and White)
img = rgb2gray(imread(imgName));
newImg = radiallyDistort(img, distort);
fig = figure;
imshow(newImg,[],'border','tight');
saveas(fig,'Out\distBW.jpg');
%% Apply Radial Distortion (Color)
color = imread(imgName);
red = radiallyDistort(color(:,:,1), distort);
green = radiallyDistort(color(:,:,2), distort);
blue = radiallyDistort(color(:,:,3), distort);
colorImg = cat(3,red,green,blue);
fig = figure;
imshow(uint8(colorImg),'border','tight');
saveas(fig,'Out\distCol.jpg');
%% Apply Vignette and Radial Distortion (Black and White)
img = rgb2gray(imread(imgName));
img = applyVignette(img, vigDeg);
img = radiallyDistort(img, distort);
fig = figure;
imshow(img,[],'border','tight');
saveas(fig,'Out\vigDistBW.jpg');
%% Apply Vignette and Radial Distortion (Color)
img = imread(imgName);
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
red = applyVignette(red, vigDeg);
green = applyVignette(green, vigDeg);
blue = applyVignette(blue, vigDeg);
red = radiallyDistort(red, distort);
green = radiallyDistort(green, distort);
blue = radiallyDistort(blue, distort);
img = cat(3,red,green,blue);
fig = figure;
imshow(uint8(img),'border','tight');
saveas(fig,'Out\vigDistCol.jpg');