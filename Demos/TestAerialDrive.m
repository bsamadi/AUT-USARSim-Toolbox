%Test Aerial Drive
% Robot=InitializeRobot('AirRobot',[13,0.1,2]);
% pause(2)
% fprintf(Robot.Connection,'DRIVE {AltitudeVelocity 0.2}');
% pause(10)
% fprintf(Robot.Connection,'DRIVE {AltitudeVelocity 0}');
% fprintf(Robot.Connection,'DRIVE {LinearVelocity 0.2}');
% pause(10)
% KillRobot(Robot)


% % DriveAerial(Robot,Altitude,Linear,Lateral,Rotational,Normalized)

Robot=InitializeRobot('AirRobot',[13,0.1,2]);
pause(2)
DriveAerial(Robot,0.2);
pause(10)
DriveAerial(Robot,0,0.2);
pause(10)
DriveAerial(Robot,0,'same',-0.3);
pause(10)
DriveAerial(Robot,0,0,0,0.3);
pause(10)
DriveAerial(Robot,-10,'Same','SAME','same',1);
pause(10)
KillRobot(Robot)
