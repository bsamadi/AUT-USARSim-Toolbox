% RobotHeadlight(Robot,Light)
% This function Control Headlight of robot attention that if you add robot
% profile the Robot should have Headlight.
% Robot arguman is a robot structure that you can made it by
% InitializeRobot 
% Flip can be 'FALSE' or 0 to turn off the flip try and can be
% 'True' or 1 to make the robot to try flip to its ‘wheels down’ position. 
% if you dont input this arguman the default is to try flip to its 
% ‘wheels down’ position.

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function FlipRobot(Robot,Flip)
    
    default='True';
    if nargin > 2
        error('Too many input arguments');
    elseif nargin < 1
        error('Too few input arguments');
    elseif nargin == 1
        Flip=default;
    end
    
    if ischar(Flip)
        if ~(strcmpi(Flip,'True')||strcmpi(Flip,'False'))
            Flip=default;
        end
    else
        if Flip
            Flip='True';
        else
            Flip='False';
        end
    end
    
    fprintf(Robot.Connection,['DRIVE {Flip ' Flip '}']);