function R = rotationMatrix(roll, pitch, yaw)
    %X is pitch (from left of cam), Y is yaw, Z is roll.
    pitchMat = [1, 0, 0; 0, cos(pitch),...
        -sin(pitch); 0, sin(pitch), cos(pitch)];
    yawMat = [cos(yaw), 0, sin(yaw); 0, 1, 0;...
        -sin(yaw), 0, cos(yaw)];
    rollMat = [cos(roll), -sin(roll),0;sin(roll),cos(roll),0;0,0,1];
    R = yawMat * pitchMat * rollMat;
end