function RadialDistortion()
close all
clear all
clc
% scale = 0.10;
% scale = 1.0;
% scale = 0.17;
% scale = 0.0425;
scale = 0.125;
% scale = 0.25;
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
%Color
% red = radiallyDistort(color(:,:,1));
% green = radiallyDistort(color(:,:,2));
% blue = radiallyDistort(color(:,:,3));
% colorImg = cat(3,red,green,blue);
% figure
% imshow(uint8(colorImg));
end
function newImg = radiallyDistort(img)

newImg = 255 * ones(size(img,1),size(img,2));
% fid = fopen('test.txt', 'w');
rX = mean([1,size(img,1)]);
rY = mean([1,size(img,2)]);
rows = zeros(size(img,1),size(img,2));
cols = zeros(size(img,1),size(img,2));
for col = 1 : size(img,2)
    for row = 1 : size(img,1)
        rows(row,col) = col-(rY);
    end
end
for row = 1 : size(img,1)
    for col = 1 : size(img,2)
        cols(row,col) = row-(rX);
    end
end
scaleR = 0.25;
maxR = norm([(rX-1)/(size(img,1)),...
            (rY-1)/(size(img,2))]);
for row = 1:size(img,1)
    for col = 1:size(img,2)
        r = norm([(rX-row)/(size(img,1)),...
            (rY-col)/(size(img,2))])/maxR;
        
        newCoords = L(r);
        newImg(row,col) = interp2(rows,cols,img, col/newCoords, row/newCoords);
%         a = [row, col, r, newCoords];
%         fprintf(fid, '%f %f %f %f\r\n', a);
    end
end
% fclose(fid);
end
function out = L(r)
k1 = 1.03689;
k2 = 0.0487908;
k3 = 0.0116894;
k4 = 0.00841614;
out = 1 + (k1 * r) + (k2 * (r^2)) + (k3 * (r^3)) + (k4 * (r^4));
% out = 1 + (k1 * r);

end