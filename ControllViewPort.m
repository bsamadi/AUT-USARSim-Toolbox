%NOT TESTED

% Amirkabir University of Tehran (Tehran Polytechnic)
% Summer 2011
% http://www.mechatronics3d.com

function ControllViewPort(Robot,ViewNum,View1,View2,View3,View4)
    if nargin > 6
        error('Too many input arguments');
    elseif nargin < 2
        error('Too few input arguments');
    elseif nargin == 6
        ViewNum=CheckInput(ViewNum);
        Msg=['SET {Type Viewports} {Config ' ViewNum '}'];
        if ~strcmpi(View1,'Same')
            Msg=[Msg ' {Viewport1 ' View1 '}'];
        end
        if ~strcmpi(View2,'Same')
            Msg=[Msg ' {Viewport2 ' View2 '}'];
        end
        if ~strcmpi(View3,'Same')
            Msg=[Msg ' {Viewport3 ' View3 '}'];
        end
        if ~strcmpi(View4,'Same')
            Msg=[Msg ' {Viewport4 ' View4 '}'];
        end
    elseif nargin == 5
        ViewNum=CheckInput(ViewNum);
        Msg=['SET {Type Viewports} {Config ' ViewNum '}'];
        if ~strcmpi(View1,'Same')
            Msg=[Msg ' {Viewport1 ' View1 '}'];
        end
        if ~strcmpi(View2,'Same')
            Msg=[Msg ' {Viewport2 ' View2 '}'];
        end
        if ~strcmpi(View3,'Same')
            Msg=[Msg ' {Viewport3 ' View3 '}'];
        end
    elseif nargin == 4
        ViewNum=CheckInput(ViewNum);
        Msg=['SET {Type Viewports} {Config ' ViewNum '}'];
        if ~strcmpi(View1,'Same')
            Msg=[Msg ' {Viewport1 ' View1 '}'];
        end
        if ~strcmpi(View2,'Same')
            Msg=[Msg ' {Viewport2 ' View2 '}'];
        end
    elseif nargin == 3
        ViewNum=CheckInput(ViewNum);
        Msg=['SET {Type Viewports} {Config ' ViewNum '}'];
        if ~strcmpi(View1,'Same')
            Msg=[Msg ' {Viewport1 ' View1 '}'];
        end
    elseif nargin == 2
        ViewNum=CheckInput(ViewNum);
        Msg=['SET {Type Viewports} {Config ' ViewNum '}'];
    end
    
    fprintf(Robot.Connection,Msg);
    
    function OutViewNum=CheckInput(ViewNum)
        if ischar(ViewNum)
            if ~(strcmpi(ViewNum,'QuadView')||strcmpi(ViewNum,'SingleView'))
                Out='QuadView';
            end
        else
            if ViewNum
                OutViewNum='QuadView';
            else
                OutViewNum='SingleView';
            end
        end
    end
end