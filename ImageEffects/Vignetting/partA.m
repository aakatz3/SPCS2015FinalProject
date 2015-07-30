%TODO: Comment!
function partA()
color = imread('bac.jpg');
img = rgb2gray(color);
bwVig = vignette(img);
rVig = vignette(color(:,:,1));
gVig = vignette(color(:,:,2));
bVig = vignette(color(:,:,3));
colorVig = cat(3,rVig,gVig,bVig);
figure
imshow(bwVig,[],'Border','tight');
figure
imshow(colorVig,'Border','tight');
end

function img = vignette(img)
sizeImg = size(img);
rX = mean([1,sizeImg(1)]);
rY = mean([1,sizeImg(2)]);
maxTheta = norm([(rX-1)/(sizeImg(1)),...
    (rY-1)/(sizeImg(2))]);
for row = 1 : size(img,1)
    for col = 1 : size(img,2)
        theta = degtorad(45) * ...
            (norm([(col-rX)/(sizeImg(1)),...
            (row-rY)/(sizeImg(2))])/maxTheta);
        img(row,col) = img(row,col) * (cos(theta) ^ 4);
    end
end
end