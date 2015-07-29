function RadialDistortion()
% scale = 0.10;
scale = 1.0;
% scale = 0.17;
% scale = 0.0425;
% scale = 0.125;
% bscale = 0.25;
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
imgR = ones(sizeImg(1),sizeImg(2));
imgxq = ones(sizeImg(1),sizeImg(2));
imgyq = ones(sizeImg(1),sizeImg(2));
newImg = 255 * ones(sizeImg(1),sizeImg(2));
%fid = fopen('vals1.csv', 'w');
%fprintf(fid, 'row,col,r,newCoords,xq,yq\r\n');
rX = mean([1,sizeImg(1)]);
rY = mean([1,sizeImg(2)]);
maxR = norm([(rX-1)/(sizeImg(1)),...
            (rY-1)/(sizeImg(2))]);
X = zeros(sizeImg(1),sizeImg(2));
Y = zeros(sizeImg(1),sizeImg(2));
% for row = 1 : sizeImg(1)
%     for col = 1 : sizeImg(2)
%         Y(row,col) = (row);
%         X(row,col) = (col);
%     end
% end
for row = 1:sizeImg(1)
    for col = 1:sizeImg(2)
        r = norm([(col-rX)/(sizeImg(1)),...
            (row-rY)/(sizeImg(2))])/maxR;
        imgR(row,col) = r;
        newCoords = L(r);
%         xq = abs(col - floor(sizeImg(2)/2))/(newCoords);
%         yq = abs(row - floor(sizeImg(1)/2))/(newCoords);
        xq = col/newCoords;
        yq = row/newCoords;
        imgxq(row,col) = xq;
        imgyq(row,col) = yq;
         newImg(row,col) = interp2(img, xq, yq);
%        newImg(row,col) = interp2(X,Y,img, xq, yq);
%         a = [row, col, r, newCoords,xq,yq];
%        fprintf(fid, '%f,%f,%f,%f,%f,%f\r\n', a);
    end
end
%fclose(fid);
figure
imshow(imgR,[]);
title('R');
disp(imgR);
figure
imshow(X,[]);
title('X');
min(min(X))
max(max(X))
figure
imshow(Y,[]);
title('Y');
min(min(Y))
max(max(Y))
figure
imshow(imgxq,[]);
title('xq');
min(min(imgxq))
max(max(imgxq))
figure
imshow(imgyq,[]);
title('yq');
min(min(imgyq))
max(max(imgyq))
end
function out = L(r)
 k1 = 1.03689;
k2 = 0.0487908;
k3 = 0.0116894;
k4 = 0.00841614;
out = 1 + (k1 * r) + (k2 * (r^2)) + (k3 * (r^3)) + (k4 * (r^4));
% out = 1 + (k1 * r);

end