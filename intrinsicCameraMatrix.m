
function K = intrinsicCameraMatrix()
    f = 1;              %Focus distance
    px = 0;             %Point of intersection of principal axis and image plane (x)
    py = 0;             %Point of intersection of principal axis and image plane (y)
    %sx = 0.000000114;  %Canon scale pixel width
    %sy = 0.000000114;  %Canon scale pixel height
    sx = 10;            %Pixel width
    sy = 10;            %Pixel Height
    mx = inv(sx);
    my = inv(sy);
    ax = f*mx;
    ay = f*my;
    x0 = mx*px;
    y0 = my*py;
    K = [ax, 0,x0; 0, ay, y0; 0,0,1];
end