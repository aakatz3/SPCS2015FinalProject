function R = rotationMatrix(roll, pitch, yaw)
    %X is pitch (from left of cam), Y is yaw, Z is roll.
    rollMat = [1, 0, 0; 0, cos(roll),...
        -sin(roll); 0, sin(roll), cos(roll)];
    pitchMat = [cos(pitch), 0, sin(pitch); 0, 1, 0;...
        -sin(pitch), 0, cos(pitch)];
    yawMat = [0, cos(yaw), -sin(yaw); 0, sin(yaw), cos(yaw); 0, 0, 1];
    R = yawMat * pitchMat * rollMat;
end