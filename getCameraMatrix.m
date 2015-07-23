function P = getCameraMatrix()
    
    I = [1,0,0;0,1,0;0,0,1];
    K = intrinsicCameraMatrix();
    R = rotationMatrix(pi/2,pi,pi/10);
    C = [0;0;0];
    P = K * R*[I, -C];
end