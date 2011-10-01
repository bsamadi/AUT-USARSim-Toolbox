%Test Omni Drive
% Robot=InitializeRobot('Lisa',[13,0.1,1.8]);
% pause(2)
% fprintf(Robot.Connection,'DRIVE {WheelNumber 0} {WheelSpeed 3.14} {WheelSteer 1.5708} {WheelNumber 1} {WheelSpeed 3.14} {WheelSteer 1.5708}');
% pause(11)
% fprintf(Robot.Connection,'DRIVE {WheelNumber 0} {WheelSpeed 6.28} {WheelSteer 0.7854} {WheelNumber 1} {WheelSpeed 6.28} {WheelSteer 0.7854}');
% pause(14)
% fprintf(Robot.Connection,'DRIVE {WheelNumber 0} {WheelSpeed 3.14} {WheelSteer 0} {WheelNumber 1} {WheelSpeed 3.14} {WheelSteer 0}');
% pause(18)
% fprintf(Robot.Connection,'DRIVE {WheelNumber 0} {WheelSpeed 3.14} {WheelSteer 0.7854} {WheelNumber 1} {WheelSpeed -3.14} {WheelSteer 0.7854}');
% pause(2)
% fprintf(Robot.Connection,'DRIVE {WheelNumber 1} {WheelSpeed 3.14} {WheelSteer 0.7854}');
% pause(10)
% KillRobot(Robot)


Robot=InitializeRobot('Lisa',[13,0.1,1.8]);
pause(2)
DriveOmniWheel(Robot,[0 1],[pi pi],[pi/2 pi/2]);
pause(11)
DriveOmniWheel(Robot,0,2*pi,pi/4);
DriveOmniWheel(Robot,1,2*pi,pi/4);
pause(14)
DriveOmniWheel(Robot,[0 1],'Same',[0 0]);
pause(18)
DriveOmniWheel(Robot,[0 1],'Same',[pi/4 pi/4]);
DriveOmniWheel(Robot,[0 1],[2 -2]);
pause(2)
DriveOmniWheel(Robot,[0 1])
pause(10)
KillRobot(Robot)