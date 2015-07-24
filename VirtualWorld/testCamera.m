clear all
clc
for a = -1:1:1
    for b = -1:1:1
        for c = -1:1:1
            fprintf('A=%d',a);
            fprintf('B=%d',b);
            fprintf('C=%d',c);
            testPointOne = [1;1;1;1];
            P = getCameraMatrix(a, b, c);
            hom = P * testPointOne;
            [hom(1)/hom(3), hom(2)/hom(3)]
        end
    end
end