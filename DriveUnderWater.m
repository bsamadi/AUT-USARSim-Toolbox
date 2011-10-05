%NOT TESTED
% DriveUnderWater(Robot,Propeller,Rudder,SternPlan,Normalized,Light)
% Drive MARINE Robot Uder Water

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function DriveUnderWater(Robot,Propeller,Rudder,SternPlan,Normalized,Light)
    if nargin > 6
        error('Too many input arguments');
    elseif nargin < 1
        error('Too few input arguments');
    elseif nargin == 6
        Normalized=CheckInput(Normalized);
        Light=CheckInput(Light);
        Msg=['DRIVE {Propeller ' num2str(Propeller) '} ' ...
            '{Rudder ' num2str(Rudder) '} '...
            '{SternPlane ' num2str(SternPlan) '} '...
            '{Normalized ' Normalized '} '...
            '{Light ' Light '}'];
    elseif nargin == 5
        Normalized=CheckInput(Normalized);
        Msg=['DRIVE {Propeller ' num2str(Propeller) '} ' ...
            '{Rudder ' num2str(Rudder) '} '...
            '{SternPlane ' num2str(SternPlan) '} '...
            '{Normalized ' Normalized '}'];
    elseif nargin == 4
        Msg=['DRIVE {Propeller ' num2str(Propeller) '} ' ...
            '{Rudder ' num2str(Rudder) '} '...
            '{SternPlane ' num2str(SternPlan) '}'];
    elseif nargin == 3
        Msg=['DRIVE {Propeller ' num2str(Propeller) '} ' ...
            '{Rudder ' num2str(Rudder) '}'];
    elseif nargin == 2
        Msg=['DRIVE {Propeller ' num2str(Propeller) '}'];
    elseif nargin == 1
        Msg='DRIVE {Propeller 0}';
    end
    
    fprintf(Robot.Connection,Msg);
    
    function Out=CheckInput(In,default)
        if ischar(In)
            if ~(strcmp(In,'True')||strcmp(In,'False'))
                Out=default;
            end
        else
            if In
                Out='True';
            else
                Out='False';
            end
        end
    end
end