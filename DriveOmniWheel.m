% DriveOmniWheel(Robot,Wheels,Speeds,Steers)
% Drive Robots like Lisa!

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function DriveOmniWheel(Robot,Wheels,Speeds,Steers)
    if nargin > 4
        error('Too many input arguments');
    elseif nargin < 2
        error('Too few input arguments');
    elseif nargin == 4
        NSpeeds=length(Speeds)*~(ischar(Speeds));
        NSteers=length(Steers)*~(ischar(Steers));
    elseif nargin == 3
        NSpeeds=length(Speeds)*~(ischar(Speeds));
        NSteers=0;
    elseif nargin == 2
        NSpeeds=length(Wheels);
        NSteers=0;
        Speeds=zeros(1,NSpeeds); 
    end
    
    Msg='DRIVE';
    for i=1:length(Wheels)
        Msg=[Msg ' {WheelNumber ' num2str(Wheels(i)) '}'];
        if i<=NSpeeds
            Msg=[Msg ' {WheelSpeed ' num2str(Speeds(i)) '}'];
        end
        if i<=NSteers
            Msg=[Msg ' {WheelSteer ' num2str(Steers(i)) '}'];
        end
    end
    
    fprintf(Robot.Connection,Msg);
end