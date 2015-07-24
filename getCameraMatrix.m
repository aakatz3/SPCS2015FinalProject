function P = getCameraMatrix(a,b,c)
    
    I = [1,0,0;0,1,0;0,0,1];
    K = intrinsicCameraMatrix();
    R = rotationMatrix(a * pi/4,b * pi/4,c * pi/4);
    C = [0;0;0];
    P = K * R * [I, -C];
end