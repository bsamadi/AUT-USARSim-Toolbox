% Robot = InitializeRobot(Class,Position,Name,Orientation)
% This function Initialize a robot of type TCP/IP with name robot_Name, at
% an initial position of robot_Position with orientation robot_Orientation
% rob - java class object
% robot_Name - string, default is set by USARSim
% robot_Class - string, default is 'TeleMax'
% robot_Position - 1x3 vector, default is set by USARSim
% robot_Orientation - 1x3 vector, default is [0 0 0]
function DriveRobotDiff(Robot,Right,Left,Normalized)
    if nargin > 4
        error('Too many input arguments');
    elseif nargin == 4
        if Normalized
            Normalized='True';
        else
            Normalized='False';
        end
        fprintf(Robot.Connection,['DRIVE {Left ' num2str(Left) '} ' ...
            '{Right ' num2str(Right) '} {Normalize ' Normalized '}']);
    elseif nargin == 3
        fprintf(Robot.Connection,['DRIVE {Left ' num2str(Left) '} ' ...
            '{Right ' num2str(Right) '} {Normalize False}']);
    elseif nargin < 3
        error('Too few input arguments');
    end