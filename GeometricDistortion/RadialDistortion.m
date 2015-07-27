function RadialDistortion()
%img = rgb2gray(imread('1010.bmp'));
img = rgb2gray(imread('bac.jpg'));
imshow(img,[]);
newImg(1,1)=0;
for row = 1:size(img,1)
    for col = 1:size(img,2)
        newCoords = L(norm([...
            mean([1,size(img,1)])-row,...
            mean([1,size(img,2)])-col]));
        newImg(abs(round(newCoords*row)),abs(round(newCoords*col))) = img(row,col);
    end
end
figure
imshow(newImg,[]);
end

function out = L(r)
k1 = 0.103689;
k2 = 0.00487908;
k3 = 0.00116894;
k4 = 0.000841614;
out = 1 + (k1 * r) + (k2 * (r^2)) + (k3 * (r^3)) + (k4 * (r^4));
end