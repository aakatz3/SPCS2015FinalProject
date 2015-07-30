function RadialDistortion()
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
newImg = radiallyDistort(img);
figure
imshow(newImg,[],'border','tight');
%Color
red = radiallyDistort(color(:,:,1));
green = radiallyDistort(color(:,:,2));
blue = radiallyDistort(color(:,:,3));
colorImg = cat(3,red,green,blue);
figure
imshow(uint8(colorImg),'border','tight');
end
function newImg = radiallyDistort(img)
sizeImg = size(img);
xq = ones(sizeImg(1),sizeImg(2));
yq = ones(sizeImg(1),sizeImg(2));
rX = mean([1,sizeImg(2)]);
rY = mean([1,sizeImg(1)]);
X = zeros(sizeImg(1),sizeImg(2));
Y = zeros(sizeImg(1),sizeImg(2));
for row = 1:sizeImg(1)
    for col = 1:sizeImg(2)
        X(row,col) = col-rX;
        Y(row,col) = row-rY;
        r = norm([(col-rX)/(sizeImg(2)), (row-rY)/(sizeImg(1))]);        
        newCoords = L(r);
        xq(row,col) = X(row,col) * newCoords;
        yq(row,col) = Y(row,col) * newCoords;
    end
end
maxX = max( X(:) );
maxY = max( Y(:) );
X = X ./ maxX;
Y = Y ./ maxY;
xq = xq ./ maxX;
yq = yq ./ maxY;
newImg = round(interp2(X,Y,double(img), xq,yq));
end
function out = L(r)
    k1 = 1.103689;
    k2 = 0.000487908;
    k3 = 0.000116894;
    k4 = 0.0000841614;
    out = 1 + (k1 * r) + (k2 * (r^2)) + (k3 * (r^3)) + (k4 * (r^4));
end