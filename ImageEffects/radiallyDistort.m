function newImg = radiallyDistort(img, factor)
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
        newCoords = L(r, factor);
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
function out = L(r, factor)
    k1 = factor * 0.10103689;
    k2 = factor * 0.00000487908;
    k3 = factor * 0.00000116894;
    k4 = factor * 0.000000841614;
    out = 1 + (k1 * r) + (k2 * (r^2)) + (k3 * (r^3)) + (k4 * (r^4));
end