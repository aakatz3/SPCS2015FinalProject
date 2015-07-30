function RadialDistortion()
clc
clear all
close all
% scale = 0.10;
% scale = 1.0;
% scale = 0.17;
% scale = 0.0425;
scale = 0.125;
% scale = 0.25
% imgName = '1010.bmp';
imgName = 'bac.jpg';
% imgName = 'cat.jpg';
% imgName = 'smallbac.jpg';
% imgName = 'ms.png';
% imgName = 'bliss.jpg';
img = imresize(rgb2gray(imread(imgName)),scale);
% color = imresize(imread(imgName),scale);
figure
imshow(img,[]);
% figure
% imshow(color);
newImg = radiallyDistort(img);
figure
imshow(newImg,[]);
%disp (newImg);
%disp (img);
%Color
% red = radiallyDistort(color(:,:,1));
% green = radiallyDistort(color(:,:,2));
% blue = radiallyDistort(color(:,:,3));
% colorImg = cat(3,red,green,blue);
% figure
% imshow(uint8(colorImg));
end
function newImg = radiallyDistort(img)
sizeImg = size(img);
imgL = ones(sizeImg(1), sizeImg(2));
imgR = ones(sizeImg(1),sizeImg(2));
xq = ones(sizeImg(1),sizeImg(2));
yq = ones(sizeImg(1),sizeImg(2));
newImg = 255 * ones(sizeImg(1),sizeImg(2));
%fid = fopen('vals1.csv', 'w');
%fprintf(fid, 'row,col,r,newCoords,xq,yq\r\n');
rX = mean([1,sizeImg(1)]);
rY = mean([1,sizeImg(2)]);
maxR = norm([(rX-1)/(sizeImg(1)),...
    (rY-1)/(sizeImg(2))]);
X = zeros(sizeImg(1),sizeImg(2));
Y = zeros(sizeImg(1),sizeImg(2));
for row = 1:sizeImg(1)
    for col = 1:sizeImg(2)
        X(row,col) = (col);
        Y(row,col) = (row);
        r = norm([(col-rY)/(sizeImg(1)),...
            (row-rX)/(sizeImg(2))])/maxR;
        imgR(row,col) = r;
        newCoords = L(r);
        imgL(row,col) = newCoords;
        %         xq = abs(col - floor(sizeImg(2)/2))/(newCoords);
        %         yq = abs(row - floor(sizeImg(1)/2))/(newCoords);
        xq(row,col) = col/newCoords;
        yq(row,col) = row/newCoords;
        %         newImg(row,col) = interp2(img, xq, yq);
        
        %         a = [row, col, r, newCoords,xq,yq];
        %        fprintf(fid, '%f,%f,%f,%f,%f,%f\r\n', a);
    end
end
newImg = interp2(X,Y,img, xq,yq);
figure
imshow(imgL,[]);
%fclose(fid);
% figure
% imshow(imgR,[]);
% title('R');
% disp(imgR);
% figure
% imshow(X,[]);
% title('X');
% min(min(X))
% max(max(X))
% figure
% imshow(Y,[]);
% title('Y');
% min(min(Y))
% max(max(Y))
% figure
% imshow(xq,[]);
% title('xq');
% min(min(xq))
% max(max(xq))5
% figure
% imshow(yq,[]);
% title('yq');
% min(min(yq))
% max(max(yq))
end
function out = L(r)
k1 = 10 * 0.103689;
k2 = 10 * 0.00487908;
k3 = 10 * 0.00116894;
k4 = 10 * 0.000841614;
out = 1 + (k1 * r) + (k2 * (r^2)) + (k3 * (r^3)) + (k4 * (r^4));
% out = 1 + (k1 * r);
%out = 2;
end