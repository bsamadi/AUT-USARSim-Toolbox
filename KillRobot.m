% Robot = InitializeRobot(Class,Position,Name,Orientation)
% This function close the port that Robot connect too USARSim & when you
% close aPort USARSim will clear the Robot
function KillRobot(Robot)
    
    if nargin > 1
        error('Too many input arguments');
    elseif nargin<1
        error('Not enough input arguments. The Robot must be specified.');
    else
        fclose(Robot.Connection);
%         delete(Robot.Connection);
    end