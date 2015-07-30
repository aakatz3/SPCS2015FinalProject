function partB()
close all
vig = imresize(imread('vignetting.jpg'),0.25);
img = rgb2gray(vig);
%fig1 = figure;
newImg = unVignette(img, degtorad(45));
imshow(newImg,[]);
%  for i = 0 : 200
%      newImg = unVignette(img, degtorad(i));
%      disp(num2str(i));
%     figure(fig1);
%      imshow(newImg, []);
%  end
end

function img = unVignette(img, baseAngle)
sizeImg = size(img);
rX = mean([1,sizeImg(1)]);
rY = mean([1,sizeImg(2)]);
divImg = zeros(sizeImg(1),sizeImg(2));
maxTheta = norm([(rX-sizeImg(1))/(sizeImg(1)),...
    (rY-sizeImg(2))/(sizeImg(2))])/2*pi;
for row = 1 : size(img,1)
    for col = 1 : size(img,2)
        theta = baseAngle * (norm([(col-rY)/(sizeImg(1)),...
            (row-rX)/(sizeImg(2))]))/pi;
        divImg(row,col) = (cos(theta) ^ 4);
    end
end
img = double(img) ./ divImg;
img = round(img);
%figure(fig2);
%imshow(divImg,[]);
end