% RobotHeadlight(Robot,Light)
% This function Control Headlight of robot attention that if you add robot
% profile the Robot should have Headlight.
% Robot arguman is a robot structure that you can made it by
% InitializeRobot 
% Light can be 'OFF' or 'FALSE' or 0 to turn off the headlight and can be
% 'ON' or 'True' or 1 to turn on the headlight if you dont input this
% arguman the default is to turnoff the headlight
function RobotHeadlight(Robot,Light)
    if isfield (Robot,'HLight')
        if ~Robot.NHLight
            error('This Robot had no Headlight to control');
        end
    end
    
    default='False';
    if nargin > 2
        error('Too many input arguments');
    elseif nargin < 1
        error('Too few input arguments');
    elseif nargin == 1
        Light=default;
    end
    
    if ischar(Light)
        if strcmpi(Light,'On')
            Light='True';
        elseif strcmpi(Light,'Off')
            Light='False';
        elseif ~(strcmpi(Light,'True')||strcmpi(Light,'False'))
            Light=default;
        end
    else
        if Light
            Light='True';
        else
            Light='False';
        end
    end
    
    fprintf(Robot.Connection,['DRIVE {Light ' Light '}']);