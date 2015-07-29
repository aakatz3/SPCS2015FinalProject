function partA()
img = imresize(rgb2gray(imread('bac.jpg')),0.25);
imshow(radiallyDistort(img),[]);
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
        newCoords = cos(r)^4;
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
