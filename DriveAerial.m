% DriveOmniWheel(Robot,Wheels,Speeds,Steers)
% Drive Robots like Lisa!
function DriveAerial(Robot,Altitude,Linear,Lateral,Rotational,Normalized)
    if nargin > 6
        error('Too many input arguments');
    elseif nargin < 2
        error('Too few input arguments');
    elseif nargin == 6
        Msg='DRIVE';
        if ~ischar(Altitude)
            Msg=[Msg ' {AltitudeVelocity ' num2str(Altitude) '}'];
        end
        if ~ischar(Linear)
            Msg=[Msg ' {LinearVelocity ' num2str(Linear) '}'];
        end
        if ~ischar(Lateral)
            Msg=[Msg ' {LateralVelocity ' num2str(Lateral) '}'];
        end
        if ~ischar(Rotational)
            Msg=[Msg ' {RotationalVelocity ' num2str(Rotational) '}'];
        end
        Normalized=CheckInput(Normalized);
        Msg=[Msg ' {Normalized ' Normalized '}'];
    elseif nargin == 5
        Msg='DRIVE';
        if ~ischar(Altitude)
            Msg=[Msg ' {AltitudeVelocity ' num2str(Altitude) '}'];
        end
        if ~ischar(Linear)
            Msg=[Msg ' {LinearVelocity ' num2str(Linear) '}'];
        end
        if ~ischar(Lateral)
            Msg=[Msg ' {LateralVelocity ' num2str(Lateral) '}'];
        end
        if ~ischar(Rotational)
            Msg=[Msg ' {RotationalVelocity ' num2str(Rotational) '}'];
        end
    elseif nargin == 4
        Msg='DRIVE';
        if ~ischar(Altitude)
            Msg=[Msg ' {AltitudeVelocity ' num2str(Altitude) '}'];
        end
        if ~ischar(Linear)
            Msg=[Msg ' {LinearVelocity ' num2str(Linear) '}'];
        end
        if ~ischar(Lateral)
            Msg=[Msg ' {LateralVelocity ' num2str(Lateral) '}'];
        end
    elseif nargin == 3
        Msg='DRIVE';
        if ~ischar(Altitude)
            Msg=[Msg ' {AltitudeVelocity ' num2str(Altitude) '}'];
        end
        if ~ischar(Linear)
            Msg=[Msg ' {LinearVelocity ' num2str(Linear) '}'];
        end
    elseif nargin == 2
        Msg='DRIVE';
        if ~ischar(Altitude)
            Msg=[Msg ' {AltitudeVelocity ' num2str(Altitude) '}'];
        end
    end
    
    fprintf(Robot.Connection,Msg);
    
    function Out=CheckInput(In)
        if ischar(In)
            if ~(strcmp(In,'True')||strcmp(In,'False'))
                Out='False';
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