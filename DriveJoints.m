% DriveJoints(Robot,Name,Value,Steer,Order)
% Drive Robots joint
% NOT TESTED

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function DriveJoints(Robot,Name,Value,Steer,Order)
    if nargin > 5
        error('Too many input arguments');
    elseif nargin < 2
        error('Too few input arguments');
    elseif nargin == 5
        Msg=['DRIVE {Name ' Name '}'];
        if ~ischar(Value)
            Msg=[Msg ' {Value ' num2str(Value) '}'];
        end
        if ~ischar(Steer)
            Msg=[Msg ' {Steer ' num2str(Steer) '}'];
        end
        if ~ischar(Order)
            Msg=[Msg ' {Order ' num2str(Order) '}'];
        end
    elseif nargin == 4
        Msg=['DRIVE {Name ' Name '}'];
        if ~ischar(Value)
            Msg=[Msg ' {Value ' num2str(Value) '}'];
        end
        if ~ischar(Steer)
            Msg=[Msg ' {Steer ' num2str(Steer) '}'];
        end
    elseif nargin == 3
        Msg=['DRIVE {Name ' Name '} {Value ' num2str(Value) '}'];
    elseif nargin == 2
        Msg=['DRIVE {Name ' Name '} {Value 0}'];
    end
    
    fprintf(Robot.Connection,Msg);
end