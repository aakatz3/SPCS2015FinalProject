function img = applyVignette(img, degrees)
sizeImg = size(img);
rX = mean([1,sizeImg(1)]);
rY = mean([1,sizeImg(2)]);
maxTheta = norm([(rX-1)/(sizeImg(1)),...
    (rY-1)/(sizeImg(2))]);
for row = 1 : size(img,1)
    for col = 1 : size(img,2)
        theta = degtorad(degrees) * ...
            (norm([(col-rX)/(sizeImg(1)),...
            (row-rY)/(sizeImg(2))])/maxTheta);
        img(row,col) = img(row,col) * (cos(theta) ^ 4);
    end
end
end