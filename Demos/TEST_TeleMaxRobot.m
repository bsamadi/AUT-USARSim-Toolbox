% Test TeleMaxRobot

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

% addpath('D:\DropBox\Dropbox\USARSim\MatlabFiles\Toolbox');
clc;clear all;close all;

%Initialize Robot
Robot=InitializeRobot('TeleMax',[0.2,4,1.8],'MyRobot',[0,0,1.5708],1);
% Test Robot Arm
ControllMisPkg(Robot,'TeleMaxArm',[2 4],[3*pi/4 -3*pi/4]);
% Test Robots Joints
DriveMultipleJoints(Robot,{'FRFlipper','RRFlipper','FLFlipper','RLFlipper'},[-1 1 -1 1])
% wait till commands done
pause(15);
ControllViewPort(Robot,0,'GCam')

pause()

FrapsPath='E:/Fraps/Screenshots';
Pattern=imread('Pattern.jpg');

    [Image]=ReadFrapsPic(FrapsPath);
    % imshow(Image);
    % pause(0.01);
    [r,c,s]=PatternMatching(Image,Pattern);
    bound=40;
    if (c-(s(2)/2)<=bound)||(c-(s(2)/2)>=-bound)
        DriveRobotDiff(Robot,3,3,1)
    elseif c-(s(2)/2)>bound
        DriveRobotDiff(Robot,3,5,1)
    elseif c-(s(2)/2)<-bound
        DriveRobotDiff(Robot,5,3,0)
    end
    

[Names,Ranges]=SensSonar(Robot);
while all(Ranges(3:6)>0.5)
    [Names,Ranges]=SensSonar(Robot);
end

DriveSkidSteer(Robot);
pause(1)
DriveSkidSteer(Robot,5,5,1)
pause(5);
DriveSkidSteer(Robot)
pause(10);
KillRobot(Robot);