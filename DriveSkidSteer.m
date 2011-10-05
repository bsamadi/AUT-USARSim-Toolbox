% DriveSkidSteer(Robot,Right,Left,Normalized,Flip,Light)
% Drive Robot By Skid Steer (Diffrential Mode)

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function DriveSkidSteer(Robot,Right,Left,Normalized,Flip,Light)
    if nargin > 6
        error('Too many input arguments');
    elseif nargin < 1
        error('Too few input arguments');
    elseif nargin == 6
        Normalized=CheckInput(Normalized);
        Light=CheckInput(Light);
        Flip=CheckInput(Flip);
        Msg=['DRIVE {Left ' num2str(Left) '} ' ...
            '{Right ' num2str(Right) '} {Normalized ' Normalized '} '...
            '{Light ' Light '} {Flip ' Flip '}'];
    elseif nargin == 5
        Normalized=CheckInput(Normalized);
        Flip=CheckInput(Flip);
        Msg=['DRIVE {Left ' num2str(Left) '} ' ...
            '{Right ' num2str(Right) '} {Normalized ' Normalized '} '...
            '{Flip ' Flip '}'];
    elseif nargin == 4
        Normalized=CheckInput(Normalized);
        Msg=['DRIVE {Left ' num2str(Left) '} ' ...
            '{Right ' num2str(Right) '} {Normalized ' Normalized '}'];
    elseif nargin == 3
        Msg=['DRIVE {Left ' num2str(Left) '} ' ...
            '{Right ' num2str(Right) '}'];
    elseif nargin < 3
        Msg='DRIVE {Left 0} {Right 0}';
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