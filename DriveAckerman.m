% DriveAckerman(Robot,Speed,FrontSteer,Normalized,Flip,RearSteer,Light)
% Drive Robot By Ackerman methode
function DriveAckerman(Robot,Speed,FrontSteer,Normalized,Flip,RearSteer,Light)
    if nargin > 7
        error('Too many input arguments');
    elseif nargin < 1
        error('Too few input arguments');
    elseif nargin == 7
        Normalized=CheckInput(Normalized);
        Light=CheckInput(Light);
        Flip=CheckInput(Flip);
        Msg=['DRIVE {Speed ' num2str(Speed) '} ' ...
            '{FrontSteer ' num2str(FrontSteer) '} '...
            '{RearSteer ' num2str(RearSteer) '} '...
            '{Normalized ' Normalized '} '...
            '{Light ' Light '} {Flip ' Flip '}'];
    elseif nargin == 6
        Normalized=CheckInput(Normalized);
        Flip=CheckInput(Flip);
        Msg=['DRIVE {Speed ' num2str(Speed) '} ' ...
            '{FrontSteer ' num2str(FrontSteer) '} '...
            '{RearSteer ' num2str(RearSteer) '} '...
            '{Normalized ' Normalized '} '...
            '{Flip ' Flip '}'];
    elseif nargin == 5
        Normalized=CheckInput(Normalized);
        Flip=CheckInput(Flip);
        Msg=['DRIVE {Speed ' num2str(Speed) '} ' ...
            '{FrontSteer ' num2str(FrontSteer) '} '...
            '{Normalized ' Normalized '} '...
            '{Flip ' Flip '}'];
    elseif nargin == 4
        Normalized=CheckInput(Normalized);
        Msg=['DRIVE {Speed ' num2str(Speed) '} ' ...
            '{FrontSteer ' num2str(FrontSteer) '} '...
            '{Normalized ' Normalized '}'];
    elseif nargin == 3
        Msg=['DRIVE {Speed ' num2str(Speed) '} ' ...
            '{FrontSteer ' num2str(FrontSteer) '}'];
    elseif nargin == 2
        Msg=['DRIVE {Speed ' num2str(Speed) '}'];
    elseif nargin == 1
        Msg='DRIVE {Speed 0.0}';
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