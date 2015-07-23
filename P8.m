%Andrew Katz
%Homework 3
%Problem 8
function P8()
%Clean up
clc;
clear all;
close all;

%Hawaii
load ('hawaii.mat');
figure;
imshow(hawaii_m, []);
title('Original Hawaii');
showDiffMap(firstOrderLTR(hawaii_m));
title('Left to right');
showDiffMap(firstOrderTTB(hawaii_m));
title('Top to bottom');
showDiffMap(firstOrderDiag(hawaii_m));
title('Top left to bottom right gradient');

%BAC
bac = rgb2gray(imread('bac.jpg'));
figure;
imshow(bac, []);
title('Original BAC.jpg');
figure
imshow(firstOrderLTR(bac));
title('Left to right (BAC, imshow)');
figure
imshow(firstOrderTTB(bac));
title('Top to bottom (BAC, imshow)');
figure
imshow(firstOrderDiag(bac));
title('Top left to bottom right gradient (BAC, gradient)');
showDiffMap(firstOrderLTR(bac));
title('Left to right (BAC, gradient)');
showDiffMap(firstOrderTTB(bac));
title('Top to bottom (BAC, gradient)');
showDiffMap(firstOrderDiag(bac));
title('Top left to bottom right gradient (BAC, gradient)');
end

%First order difference, from top to bottom
function imgOut = firstOrderTTB(imgIn)
imgOut(1,:) = 0;
for col = 2:size(imgIn,1)
    for row = 1:size(imgIn,2)
        imgOut(col,row) = imgIn(col,row) - imgIn((col - 1),row);
    end
end
end

%First order difference, from left to right
function imgOut = firstOrderLTR(imgIn)
imgOut(:,1) = 0;
for col = 1:size(imgIn,1)
    for row = 2:size(imgIn,2)
        imgOut(col,row) = imgIn(col,row) - imgIn(col,(row - 1));
    end
end
end

%First order difference, from top to bottom
function imgOut = firstOrderDiag(imgIn)
imgOut(:,1) = 0;
imgOut(1,:) = 0;
for col = 2:size(imgIn,1)
    for row = 2:size(imgIn,2)
        imgOut(col,row) = imgIn(col,row) - imgIn((col - 1),(row - 1));
    end
end
end

%Use special function to show image nicer
function fig = showDiffMap(img)
fig = figure;
imshow(img, [mean(img(:)) - 2.5 * std(img(:)), ...
             mean(img(:)) + 2.5 * std(img(:))]);
end