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