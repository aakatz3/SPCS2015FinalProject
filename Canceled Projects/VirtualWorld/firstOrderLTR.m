%First order difference, from left to right
function imgOut = firstOrderLTR(imgIn)
imgOut(:,1) = 0;
for col = 1:size(imgIn,1)
    for row = 2:size(imgIn,2)
        imgOut(col,row) = imgIn(col,row) - imgIn(col,(row - 1));
    end
end
end