function fig = showDiffMap(img)
fig = figure;
imshow(img, [mean(img(:)) - 2.5 * std(img(:)), ...
             mean(img(:)) + 2.5 * std(img(:))]);
end