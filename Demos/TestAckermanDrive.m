% Test Ackerman Drive

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

% 
% Robot=InitializeRobot('Sedan',[13,0.1,2]);
% fprintf(Robot.Connection,'DRIVE {Speed 3.0} {FrontSteer 0.523599}');
% pause(10)
% fprintf(Robot.Connection,'DRIVE {Speed 2.5} {FrontSteer -0.523599}');
% pause(11)
% fprintf(Robot.Connection,'DRIVE {Speed 10} {FrontSteer 0}');
% pause(2)
% KillRobot(Robot)


% DriveAckerman(Robot,Speed,FrontSteer,Normalized,Flip,RearSteer,Light)

Robot=InitializeRobot('Sedan',[13,0.1,2]);
DriveAckerman(Robot,3.0,pi/6)
pause(10)
DriveAckerman(Robot,2.5,-pi/6,0,0,1)
pause(11.5)
DriveAckerman(Robot,5,0,1)
pause(1)
DriveAckerman(Robot,25,pi/3,1,0,0,1)
pause(3)
DriveAckerman(Robot,-2.5,-pi/6,0,0)
DriveAckerman(Robot,-2.5,-pi/6,0)
DriveAckerman(Robot,-2.5,-pi/6)
DriveAckerman(Robot,1)
DriveAckerman(Robot)
pause(1)
KillRobot(Robot)